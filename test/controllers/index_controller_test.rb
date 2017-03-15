require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_index_url
    assert_response :success
  end

  test "should get left" do
    get index_left_url
    assert_response :success
  end

  test "should get main" do
    get index_main_url
    assert_response :success
  end

  test "should get top" do
    get index_top_url
    assert_response :success
  end

end
