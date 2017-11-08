require 'test_helper'

class ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @contest = contests(:one)
  end

  test "should get index" do
    get contests_url, as: :json
    assert_response :success
  end

  test "should create contest" do
    assert_difference('Contest.count') do
      contest_params = { contestant_one: {} }
      post create_contests_url(type: Contest.contest_types.first), params: { contest: contest_params }, as: :json
    end

    assert_response 201
  end

  test 'invalid contest type should be a 404' do
    post create_contests_url(type: 'invalid'), as: :json
    assert_response 404
  end

  # test "should show contest" do
  #   get contest_url(@contest), as: :json
  #   assert_response :success
  # end
end
