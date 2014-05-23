require 'test_helper'

class EplayersControllerTest < ActionController::TestCase
  setup do
    @eplayer = eplayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eplayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eplayer" do
    assert_difference('Eplayer.count') do
      post :create, eplayer: {  }
    end

    assert_redirected_to eplayer_path(assigns(:eplayer))
  end

  test "should show eplayer" do
    get :show, id: @eplayer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eplayer
    assert_response :success
  end

  test "should update eplayer" do
    patch :update, id: @eplayer, eplayer: {  }
    assert_redirected_to eplayer_path(assigns(:eplayer))
  end

  test "should destroy eplayer" do
    assert_difference('Eplayer.count', -1) do
      delete :destroy, id: @eplayer
    end

    assert_redirected_to eplayers_path
  end
end
