require "test_helper"

class MainCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_course = main_courses(:one)
  end

  test "should get index" do
    get main_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_main_course_url
    assert_response :success
  end

  test "should create main_course" do
    assert_difference("MainCourse.count") do
      post main_courses_url, params: { main_course: { arrival: @main_course.arrival, comment: @main_course.comment, description: @main_course.description, name: @main_course.name, number_of_guests: @main_course.number_of_guests, price: @main_course.price } }
    end

    assert_redirected_to main_course_url(MainCourse.last)
  end

  test "should show main_course" do
    get main_course_url(@main_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_course_url(@main_course)
    assert_response :success
  end

  test "should update main_course" do
    patch main_course_url(@main_course), params: { main_course: { arrival: @main_course.arrival, comment: @main_course.comment, description: @main_course.description, name: @main_course.name, number_of_guests: @main_course.number_of_guests, price: @main_course.price } }
    assert_redirected_to main_course_url(@main_course)
  end

  test "should destroy main_course" do
    assert_difference("MainCourse.count", -1) do
      delete main_course_url(@main_course)
    end

    assert_redirected_to main_courses_url
  end
end
