require "test_helper"

class MafftControllerTest < ActionDispatch::IntegrationTest
  test "should get align" do
    get mafft_align_url
    assert_response :success
  end
end
