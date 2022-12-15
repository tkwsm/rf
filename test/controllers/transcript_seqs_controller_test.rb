require "test_helper"

class TranscriptSeqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transcript_seq = transcript_seqs(:one)
  end

  test "should get index" do
    get transcript_seqs_url
    assert_response :success
  end

  test "should get new" do
    get new_transcript_seq_url
    assert_response :success
  end

  test "should create transcript_seq" do
    assert_difference('TranscriptSeq.count') do
      post transcript_seqs_url, params: { transcript_seq: { nuc_sequence: @transcript_seq.nuc_sequence, project_id: @transcript_seq.project_id, transcript_id: @transcript_seq.transcript_id } }
    end

    assert_redirected_to transcript_seq_url(TranscriptSeq.last)
  end

  test "should show transcript_seq" do
    get transcript_seq_url(@transcript_seq)
    assert_response :success
  end

  test "should get edit" do
    get edit_transcript_seq_url(@transcript_seq)
    assert_response :success
  end

  test "should update transcript_seq" do
    patch transcript_seq_url(@transcript_seq), params: { transcript_seq: { nuc_sequence: @transcript_seq.nuc_sequence, project_id: @transcript_seq.project_id, transcript_id: @transcript_seq.transcript_id } }
    assert_redirected_to transcript_seq_url(@transcript_seq)
  end

  test "should destroy transcript_seq" do
    assert_difference('TranscriptSeq.count', -1) do
      delete transcript_seq_url(@transcript_seq)
    end

    assert_redirected_to transcript_seqs_url
  end
end
