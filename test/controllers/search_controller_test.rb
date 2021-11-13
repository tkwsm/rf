require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get blast" do
    get search_blast_url
    assert_response :success
  end
end
