require "application_system_test_case"

class MainCoursesTest < ApplicationSystemTestCase
  setup do
    @main_course = main_courses(:one)
  end

  test "visiting the index" do
    visit main_courses_url
    assert_selector "h1", text: "Main courses"
  end

  test "should create main course" do
    visit main_courses_url
    click_on "New main course"

    fill_in "Arrival", with: @main_course.arrival
    fill_in "Comment", with: @main_course.comment
    fill_in "Description", with: @main_course.description
    fill_in "Name", with: @main_course.name
    fill_in "Number of guests", with: @main_course.number_of_guests
    fill_in "Price", with: @main_course.price
    click_on "Create Main course"

    assert_text "Main course was successfully created"
    click_on "Back"
  end

  test "should update Main course" do
    visit main_course_url(@main_course)
    click_on "Edit this main course", match: :first

    fill_in "Arrival", with: @main_course.arrival
    fill_in "Comment", with: @main_course.comment
    fill_in "Description", with: @main_course.description
    fill_in "Name", with: @main_course.name
    fill_in "Number of guests", with: @main_course.number_of_guests
    fill_in "Price", with: @main_course.price
    click_on "Update Main course"

    assert_text "Main course was successfully updated"
    click_on "Back"
  end

  test "should destroy Main course" do
    visit main_course_url(@main_course)
    click_on "Destroy this main course", match: :first

    assert_text "Main course was successfully destroyed"
  end
end
