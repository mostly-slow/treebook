require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "/login opens login page" do
    get "/login"
    assert_response :success
  end
  
  test "/logout opens login page" do
     get "/logout"
     assert_response :redirect
     assert_redirected_to "/"
   end

  test "/registre opens signup page" do
    get "/registre"
    assert_response :success
  end

end
