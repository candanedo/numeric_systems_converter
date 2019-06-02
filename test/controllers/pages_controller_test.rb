require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get decimal" do
    get pages_decimal_url
    assert_response :success
  end

  test "should get binary" do
    get pages_binary_url
    assert_response :success
  end

  test "should get octal" do
    get pages_octal_url
    assert_response :success
  end

  test "should get hexadecimal" do
    get pages_hexadecimal_url
    assert_response :success
  end

end
