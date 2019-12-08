require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Cname", with: @course.cname
    fill_in "Credits", with: @course.credits
    fill_in "Desc", with: @course.desc
    fill_in "Prof", with: @course.prof
    fill_in "Subj", with: @course.subj
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Cname", with: @course.cname
    fill_in "Credits", with: @course.credits
    fill_in "Desc", with: @course.desc
    fill_in "Prof", with: @course.prof
    fill_in "Subj", with: @course.subj
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
