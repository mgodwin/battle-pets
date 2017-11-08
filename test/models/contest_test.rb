require 'test_helper'

class ContestTest < ActiveSupport::TestCase
  test "saves contestants on save" do
    contest = Contests::Jumping.new(contestant_one: {name: 'Fluffy'})
    contest.save
    assert_equal 'Fluffy', contest.contestants.first.name
  end
end
