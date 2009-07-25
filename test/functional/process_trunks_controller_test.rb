require 'test_helper'

class ProcessTrunksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:process_trunks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create process_trunk" do
    assert_difference('ProcessTrunk.count') do
      post :create, :process_trunk => valid_process_trunk_attributes()
    end

    assert_redirected_to process_trunk_path(assigns(:process_trunk))
  end

  test "should show process_trunk" do
    get :show, :id => process_trunks(:step1trunk1).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => process_trunks(:step1trunk1).to_param
    assert_response :success
  end

  test "should update process_trunk" do
    put :update, :id => process_trunks(:step1trunk1).to_param, :process_trunk => { }
    assert_redirected_to process_trunk_path(assigns(:process_trunk))
  end

  test "should destroy process_trunk" do
    assert_difference('ProcessTrunk.count', -1) do
      delete :destroy, :id => process_trunks(:step1trunk1).to_param
    end
    assert_redirected_to process_trunks_path
  end

  test "should show traceable of trunk" do
    get :index
    assert_select 'td', '87654321'
  end

  test "date format" do
    get :index
    assert_select 'td', '13.07.2009'
  end

# test "selection list for trunk" do
#  get :edit, :id => process_trunks(:step1trunk1).id
#  assert_select 'select#trunk_id' do
#    assert_select "option", '953125641'
#    assert_select 'option[value=?]', trunks(:one).id
#  end
#end

end
