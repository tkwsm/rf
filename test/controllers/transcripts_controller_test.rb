require "test_helper"

class TranscriptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transcripts_index_url
    assert_response :success
  end
end
