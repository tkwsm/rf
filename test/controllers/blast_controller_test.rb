require "test_helper"

class BlastControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get blast_search_url
    assert_response :success
  end
end
