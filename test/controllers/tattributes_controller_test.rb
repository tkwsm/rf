require "test_helper"

class TattributesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tattributes_index_url
    assert_response :success
  end
end
