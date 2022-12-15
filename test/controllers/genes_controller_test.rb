require "test_helper"

class GenesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genes_index_url
    assert_response :success
  end
end
