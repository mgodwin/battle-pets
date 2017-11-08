class Contests::Running < Contest
  def commence
    self.running!
    a = contestants.first
    b = contestants.last

    events.create!(description: "The first to 100 feet wins.")
    sleep 1
    events.create!(description: "Ready...")
    sleep 1
    events.create!(description: "Set...")
    sleep 1
    events.create!(description: "GO!")

    a_dist = 0
    b_dist = 0
    loop do
      a_dist += get_distance(a)
      events.create!(description: "#{a.name} has gone #{a_dist} feet!")
      b_dist += get_distance(b)
      events.create!(description: "#{b.name} has gone #{b_dist} feet!")
      sleep 1
      break if a_dist >= 100 or b_dist >= 100
    end

    if a_dist > b_dist
      events.create!(description: "#{a.name} is the winner!")
      self.winner = a
    elsif b_dist > a_dist
      events.create!(description: "#{b.name} is the winner!")
      self.winner = b
    else
      self.winner = a
      events.create!(description: "It was a tie, but #{a.name} has a cooler name, so #{a.name} wins!")
    end

    self.finished!
  end

  def get_distance(contestant)
    random_bonus = (0..8).to_a.sample
    distance = (50 * contestant.speed.to_i * 0.01) + (contestant.intelligence.to_i * 0.005) + random_bonus
  end
end
