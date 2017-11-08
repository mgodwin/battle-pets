class Contests::Jumping < Contest

  def commence
    self.running!
    a = contestants.first
    b = contestants.last

    a_heights = []
    b_heights = []
    3.times do |i|
      events.create!(description: "Round #{i}")
      sleep 3
      height = get_height(a)
      events.create!(description: "#{a.name} jumps #{height} feet!")
      a_heights << height
      sleep 3
      height = get_height(b)
      b_heights << height
      events.create!(description: "#{b.name} jumps #{height} feet!")
      sleep 5
    end
    max_a = a_heights.max
    max_b = b_heights.max

    if max_a > max_b
      events.create!(description: "#{a.name} is the winner!")
      self.winner = a
    elsif max_b > max_a
      events.create!(description: "#{b.name} is the winner!")
      self.winner = b
    else
      self.winner = a
      events.create!(description: "It was a tie, but #{a.name} has a cooler name, so #{a.name} wins!")
    end

    self.finished!
  end

  def get_height(contestant)
    multiplier = [1,2,3]
    random_bonus = (0..30).to_a.sample
    base_height = 20
    height = base_height + (contestant.strength.to_i * multiplier.sample)
    if contestant.integrity.to_i > 50
      height += 10
    end
    height
  end
end
