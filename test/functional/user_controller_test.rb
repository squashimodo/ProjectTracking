require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
