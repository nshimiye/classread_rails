require 'test_helper'

class ClassfilesControllerTest < ActionController::TestCase
  setup do
    @classfile = classfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classfile" do
    assert_difference('Classfile.count') do
      post :create, classfile: {  }
    end

    assert_redirected_to classfile_path(assigns(:classfile))
  end

  test "should show classfile" do
    get :show, id: @classfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classfile
    assert_response :success
  end

  test "should update classfile" do
    put :update, id: @classfile, classfile: {  }
    assert_redirected_to classfile_path(assigns(:classfile))
  end

  test "should destroy classfile" do
    assert_difference('Classfile.count', -1) do
      delete :destroy, id: @classfile
    end

    assert_redirected_to classfiles_path
  end
end
