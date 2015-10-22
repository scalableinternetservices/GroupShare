require 'test_helper'

class StreamControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get join" do
    get :join
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
