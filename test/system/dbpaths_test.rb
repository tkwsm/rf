require "application_system_test_case"

class DbpathsTest < ApplicationSystemTestCase
  setup do
    @dbpath = dbpaths(:one)
  end

  test "visiting the index" do
    visit dbpaths_url
    assert_selector "h1", text: "Dbpaths"
  end

  test "creating a Dbpath" do
    visit dbpaths_url
    click_on "New Dbpath"

    fill_in "Abbreviation", with: @dbpath.abbreviation
    fill_in "Db path", with: @dbpath.db_path
    fill_in "Project", with: @dbpath.project_id
    fill_in "Sequence type", with: @dbpath.sequence_type
    click_on "Create Dbpath"

    assert_text "Dbpath was successfully created"
    click_on "Back"
  end

  test "updating a Dbpath" do
    visit dbpaths_url
    click_on "Edit", match: :first

    fill_in "Abbreviation", with: @dbpath.abbreviation
    fill_in "Db path", with: @dbpath.db_path
    fill_in "Project", with: @dbpath.project_id
    fill_in "Sequence type", with: @dbpath.sequence_type
    click_on "Update Dbpath"

    assert_text "Dbpath was successfully updated"
    click_on "Back"
  end

  test "destroying a Dbpath" do
    visit dbpaths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dbpath was successfully destroyed"
  end
end
