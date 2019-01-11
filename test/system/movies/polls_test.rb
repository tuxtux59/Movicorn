require "application_system_test_case"

class Movies::PollsTest < ApplicationSystemTestCase
  setup do
    @movies_poll = movies_polls(:one)
  end

  test "visiting the index" do
    visit movies_polls_url
    assert_selector "h1", text: "Movies/Polls"
  end

  test "creating a Poll" do
    visit movies_polls_url
    click_on "New Movies/Poll"

    fill_in "Create", with: @movies_poll.create
    fill_in "Show", with: @movies_poll.show
    click_on "Create Poll"

    assert_text "Poll was successfully created"
    click_on "Back"
  end

  test "updating a Poll" do
    visit movies_polls_url
    click_on "Edit", match: :first

    fill_in "Create", with: @movies_poll.create
    fill_in "Show", with: @movies_poll.show
    click_on "Update Poll"

    assert_text "Poll was successfully updated"
    click_on "Back"
  end

  test "destroying a Poll" do
    visit movies_polls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Poll was successfully destroyed"
  end
end
