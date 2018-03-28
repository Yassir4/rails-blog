require 'test_helper'

class StatiPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get stati_pages_Home_url
    assert_response :success
  end

  test "should get About" do
    get stati_pages_About_url
    assert_response :success
  end

  test "should get Contact" do
    get stati_pages_Contact_url
    assert_response :success
  end

end
