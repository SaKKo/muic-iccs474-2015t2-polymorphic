require 'test_helper'

class FinancersControllerTest < ActionController::TestCase
  setup do
    @financer = financers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:financers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create financer" do
    assert_difference('Financer.count') do
      post :create, financer: { name: @financer.name }
    end

    assert_redirected_to financer_path(assigns(:financer))
  end

  test "should show financer" do
    get :show, id: @financer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @financer
    assert_response :success
  end

  test "should update financer" do
    patch :update, id: @financer, financer: { name: @financer.name }
    assert_redirected_to financer_path(assigns(:financer))
  end

  test "should destroy financer" do
    assert_difference('Financer.count', -1) do
      delete :destroy, id: @financer
    end

    assert_redirected_to financers_path
  end
end
