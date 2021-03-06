require "test_helper"

class Public::ProductTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_product_types_new_url
    assert_response :success
  end

  test "should get show" do
    get public_product_types_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_product_types_edit_url
    assert_response :success
  end
end
