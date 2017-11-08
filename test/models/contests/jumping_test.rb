require 'test_helper'

class Contests::JumpingTest < ActiveSupport::TestCase
  test 'should set type to jumping' do
    contest = Contests::Jumping.new
    assert_equal 'Contests::Jumping', contest.type
  end
end
