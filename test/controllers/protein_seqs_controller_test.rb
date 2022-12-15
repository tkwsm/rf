require "test_helper"

class ProteinSeqsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get protein_seqs_index_url
    assert_response :success
  end
end
