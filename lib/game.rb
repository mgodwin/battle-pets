require 'arena_client'
require 'pets_client'
class Game

  def self.start
    game = self.new
    game.intro
    game.load_data
    loop do
      type = game.pick_contest_type
      game.setup_contest(type)
    end
  end

  def initialize
    @arena_client = ArenaClient.new
    @pets_client = PetsClient.new
  end

  def load_data
    print "Loading Contest Types..."
    @contest_types = @arena_client.contest_types
    print "Done\n"

    print "Loading Pets..."
    @pets = @pets_client.pets
    print "Done\n"
  end

  def intro
    puts <<~EOL
    Welcome to Battle Pets Arena!\n
    =============================
    (Exit with <Ctrl + C>)
    EOL
  end

  def pick_contest_type
    puts "\n\nPick your contest:"
    menu(@contest_types)
  end

  def setup_contest(type)
    puts <<~EOL
    ================
    #{type} Contest!
    ================
    EOL

    adjectives = ['solid', 'killer', 'steadfast', 'great', 'stellar', 'fantastic']

    puts "Select challenger 1:"
    pet_one = menu(@pets, :name)
    puts "Excellent choice! #{pet_one.name} is sure to be a #{adjectives.sample} competitor"

    puts "\n\n\n"
    puts "Select challenger 2:"
    pet_two = menu(@pets - [pet_one], :name)
    puts "Excellent choice! #{pet_two.name} is sure to be a #{adjectives.sample} competitor"

    puts "Are you ready to Rumble? (Hit <Enter> to continue)"
    $stdin.gets
    start_contest(type, pet_one, pet_two)
  end

  def start_contest(type, contestant_one, contestant_two)
    puts <<~EOL
    =================
    Starting Contest! - #{contestant_one.name} vs #{contestant_two.name}
    =================
    EOL

    contest = @arena_client.start_contest(type, contestant_one.attributes, contestant_two.attributes)
    contest_id = contest['id']

    last_id = nil
    loop do
      events = @arena_client.contest_events(contest_id, last_id)
      if events.any?
        last_id = events.last['id']
        events.each do |event|
          puts event['description']
        end
      else
        contest = @arena_client.contest(contest_id)
        break if contest['status'] == 'finished'
      end
      sleep 2
    end
  end

  def menu(menu_options, display_method = nil)
    menu_options.each_with_index do |option, index|
      if display_method
        puts "  #{index}: #{option.send(display_method)}"
      else
        puts "  #{index}: #{option}"
      end
    end
    choice_index = nil
    loop do
      choice_index = $stdin.gets
      puts choice_index
      if (0...menu_options.length).to_a.map(&:to_s).include?(choice_index.strip)
        break
      else
        puts "You entered an invalid option.  Please try again."
      end
    end
    menu_options[choice_index.to_i]
  end

end
