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

  test 'should return 404 when user does not exists' do
    get '/users/999'
    assert_response :not_found
  end

  test "cors" do
    get '/users/1', headers: { Origin: "foo.example.com" }

    assert_response :success

    assert_equal "*", response.headers["Access-Control-Allow-Origin"]
  end
end
