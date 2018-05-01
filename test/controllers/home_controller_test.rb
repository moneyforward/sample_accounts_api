require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "cors" do
    get '/', headers: { Origin: "foo.example.com" }

    assert_response :success

    # CORS を許可しないはず
    assert response.headers["Access-Control-Allow-Origin"].nil?
  end
end
