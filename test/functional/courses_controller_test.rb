require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { cname: @course.cname, cnumber: @course.cnumber, cplace: @course.cplace, croom: @course.croom, cschedule: @course.cschedule, description: @course.description, end_date: @course.end_date, start_date: @course.start_date }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: { cname: @course.cname, cnumber: @course.cnumber, cplace: @course.cplace, croom: @course.croom, cschedule: @course.cschedule, description: @course.description, end_date: @course.end_date, start_date: @course.start_date }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
