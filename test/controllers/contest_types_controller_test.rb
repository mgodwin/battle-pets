require 'test_helper'

class ContestTypesControllerTest < ActionDispatch::IntegrationTest
  test "should return a list of contest types" do
    get contest_types_url, as: :json
    assert_response :ok
    contest_types = Contest.contest_types
    assert_equal contest_types, response.parsed_body
  end
end
