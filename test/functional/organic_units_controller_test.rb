require 'test_helper'

class OrganicUnitsControllerTest < ActionController::TestCase
  setup do
    @organic_unit = organic_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organic_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organic_unit" do
    assert_difference('OrganicUnit.count') do
      post :create, organic_unit: @organic_unit.attributes
    end

    assert_redirected_to organic_unit_path(assigns(:organic_unit))
  end

  test "should show organic_unit" do
    get :show, id: @organic_unit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organic_unit.to_param
    assert_response :success
  end

  test "should update organic_unit" do
    put :update, id: @organic_unit.to_param, organic_unit: @organic_unit.attributes
    assert_redirected_to organic_unit_path(assigns(:organic_unit))
  end

  test "should destroy organic_unit" do
    assert_difference('OrganicUnit.count', -1) do
      delete :destroy, id: @organic_unit.to_param
    end

    assert_redirected_to organic_units_path
  end
end
