require File.expand_path("../api_helper", __FILE__)

context "Auth" do
  setup do
    @user = valid_user
  end

  test "authorized request works" do
    authorized_get '/api/users', @user
    assert last_response.ok?
  end

  test "unauthorized request does not work" do
    unauthorized_get '/api/users'
    assert_equal 401, last_response.status
  end


end
