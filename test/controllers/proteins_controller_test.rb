require "test_helper"

class ProteinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proteins_index_url
    assert_response :success
  end
end
