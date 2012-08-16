require 'test_helper'

class PartymessagesControllerTest < ActionController::TestCase
  setup do
    @partymessage = partymessages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partymessages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partymessage" do
    assert_difference('Partymessage.count') do
      post :create, partymessage: @partymessage.attributes
    end

    assert_redirected_to partymessage_path(assigns(:partymessage))
  end

  test "should show partymessage" do
    get :show, id: @partymessage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partymessage
    assert_response :success
  end

  test "should update partymessage" do
    put :update, id: @partymessage, partymessage: @partymessage.attributes
    assert_redirected_to partymessage_path(assigns(:partymessage))
  end

  test "should destroy partymessage" do
    assert_difference('Partymessage.count', -1) do
      delete :destroy, id: @partymessage
    end

    assert_redirected_to partymessages_path
  end
end
