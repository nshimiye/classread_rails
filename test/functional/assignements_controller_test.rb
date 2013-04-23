require 'test_helper'

class AssignementsControllerTest < ActionController::TestCase
  setup do
    @assignement = assignements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignement" do
    assert_difference('Assignement.count') do
      post :create, assignement: { Ass_number: @assignement.Ass_number, dealine: @assignement.dealine, post_date: @assignement.post_date, status: @assignement.status }
    end

    assert_redirected_to assignement_path(assigns(:assignement))
  end

  test "should show assignement" do
    get :show, id: @assignement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assignement
    assert_response :success
  end

  test "should update assignement" do
    put :update, id: @assignement, assignement: { Ass_number: @assignement.Ass_number, dealine: @assignement.dealine, post_date: @assignement.post_date, status: @assignement.status }
    assert_redirected_to assignement_path(assigns(:assignement))
  end

  test "should destroy assignement" do
    assert_difference('Assignement.count', -1) do
      delete :destroy, id: @assignement
    end

    assert_redirected_to assignements_path
  end
end
