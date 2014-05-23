require 'test_helper'

class AthsControllerTest < ActionController::TestCase
  setup do
    @ath = aths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ath" do
    assert_difference('Ath.count') do
      post :create, ath: { name: @ath.name }
    end

    assert_redirected_to ath_path(assigns(:ath))
  end

  test "should show ath" do
    get :show, id: @ath
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ath
    assert_response :success
  end

  test "should update ath" do
    patch :update, id: @ath, ath: { name: @ath.name }
    assert_redirected_to ath_path(assigns(:ath))
  end

  test "should destroy ath" do
    assert_difference('Ath.count', -1) do
      delete :destroy, id: @ath
    end

    assert_redirected_to aths_path
  end
end
