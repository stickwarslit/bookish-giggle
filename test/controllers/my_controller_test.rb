require 'test_helper'

class MyControllerTest < ActionDispatch::IntegrationTest
  test "should get mother" do
    get my_mother_url
    assert_response :success
  end

  test "should get girlfriend" do
    get my_girlfriend_url
    assert_response :success
  end

end
