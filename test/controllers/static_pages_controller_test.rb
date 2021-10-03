require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
#    get static_pages_home_url
    get root_path
    assert_response :success
    assert_select "title", "RF Genome Browser"
  end

  test "should get help" do
#    get static_pages_help_url
    get help_path
    assert_response :success
    assert_select "title", "Help|RF Genome Browser"
  end

  test "should get about" do
#    get static_pages_about_url
    get about_path
    assert_response :success
    assert_select "title", "About|RF Genome Browser"
  end

  test "should get contact" do
#    get static_pages_contact_url
    get contact_path
    assert_response :success
    assert_select "title", "Contact|RF Genome Browser"
  end

end

