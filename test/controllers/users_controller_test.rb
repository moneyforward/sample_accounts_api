require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should show user" do
    get '/users/1'
    assert_response :success

    resp = JSON.parse(response.body)
    expected = {
      "attributes" => {
      "id" => 1,
      "name" => "Alice",
      "account_ids" => [1, 3, 5],
      }
    }
    assert_equal(expected, resp)
  end
end
