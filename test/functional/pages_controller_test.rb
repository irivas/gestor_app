require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get pessoas" do
    get :pessoas
    assert_response :success
  end

  test "should get organizational_units" do
    get :organizational_units
    assert_response :success
  end

  test "should get competences" do
    get :competences
    assert_response :success
  end

end
