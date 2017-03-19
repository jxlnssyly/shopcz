require 'test_helper'

class PrivilegesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get privileges_index_url
    assert_response :success
  end

  test "should get edit" do
    get privileges_edit_url
    assert_response :success
  end

  test "should get new" do
    get privileges_new_url
    assert_response :success
  end

  test "should get create" do
    get privileges_create_url
    assert_response :success
  end

  test "should get destroy" do
    get privileges_destroy_url
    assert_response :success
  end

end
