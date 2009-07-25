require 'test_helper'

class KindsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kind)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kind" do
    assert_difference('Kind.count') do
      post :create, :kind => { }
    end

    assert_redirected_to kind_path(assigns(:kind))
  end

  test "should show kind" do
    get :show, :id => kind(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kind(:one).to_param
    assert_response :success
  end

  test "should update kind" do
    put :update, :id => kind(:one).to_param, :kind => { }
    assert_redirected_to kind_path(assigns(:kind))
  end

  test "should destroy kind" do
    assert_difference('Kind.count', -1) do
      delete :destroy, :id => kind(:one).to_param
    end

    assert_redirected_to kinds_path
  end
end
