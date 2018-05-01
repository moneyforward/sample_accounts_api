require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should show the user's accounts" do
    get '/users/1/accounts'
    assert_response :success

    resp = JSON.parse(response.body)
    expected = [
      {
        "attributes" => {
          "id" => 1,
          "user_id" => 1,
          "name" => "A銀行",
          "balance" => 20000
        }
      },
      {
        "attributes" => {
          "id" => 3,
          "user_id" => 1,
          "name" => "C信用金庫",
          "balance" => 120000
        }
      },
      {
        "attributes" => {
          "id" => 5,
          "user_id" => 1,
          "name" => "E銀行",
          "balance" => 5000
        }
      }
    ]
    assert_equal(expected, resp)
  end

  test "should show an account" do
    get "/accounts/2"
    assert_response :success

    resp = JSON.parse(response.body)
    expected = {
      "attributes" => {
        "id" => 2,
        "user_id" => 2,
        "name" => "Bカード",
        "balance" => 200
      }
    }
    assert_equal(expected, resp)
  end

  test "cors /accounts/:id" do
    get '/accounts/1', headers: { Origin: "foo.example.com" }

    assert_response :success

    assert_equal "*", response.headers["Access-Control-Allow-Origin"]
  end
end
