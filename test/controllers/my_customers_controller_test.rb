require 'test_helper'

class MyCustomersControllerTest < ActionController::TestCase
  setup do
    @my_customer = my_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_customer" do
    assert_difference('MyCustomer.count') do
      post :create, my_customer: { number: @my_customer.number, tradeable_id: @my_customer.tradeable_id, tradeable_type: @my_customer.tradeable_type }
    end

    assert_redirected_to my_customer_path(assigns(:my_customer))
  end

  test "should show my_customer" do
    get :show, id: @my_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_customer
    assert_response :success
  end

  test "should update my_customer" do
    patch :update, id: @my_customer, my_customer: { number: @my_customer.number, tradeable_id: @my_customer.tradeable_id, tradeable_type: @my_customer.tradeable_type }
    assert_redirected_to my_customer_path(assigns(:my_customer))
  end

  test "should destroy my_customer" do
    assert_difference('MyCustomer.count', -1) do
      delete :destroy, id: @my_customer
    end

    assert_redirected_to my_customers_path
  end
end
