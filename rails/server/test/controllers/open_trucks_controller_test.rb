require 'test_helper'

class OpenTrucksControllerTest < ActionController::TestCase
  setup do
    @open_truck = open_trucks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:open_trucks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create open_truck" do
    assert_difference('OpenTruck.count') do
      post :create, open_truck: { openUntil: @open_truck.openUntil, truck_id: @open_truck.truck_id }
    end

    assert_redirected_to open_truck_path(assigns(:open_truck))
  end

  test "should show open_truck" do
    get :show, id: @open_truck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @open_truck
    assert_response :success
  end

  test "should update open_truck" do
    patch :update, id: @open_truck, open_truck: { openUntil: @open_truck.openUntil, truck_id: @open_truck.truck_id }
    assert_redirected_to open_truck_path(assigns(:open_truck))
  end

  test "should destroy open_truck" do
    assert_difference('OpenTruck.count', -1) do
      delete :destroy, id: @open_truck
    end

    assert_redirected_to open_trucks_path
  end
end
