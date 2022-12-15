require "application_system_test_case"

class TranscriptSeqsTest < ApplicationSystemTestCase
  setup do
    @transcript_seq = transcript_seqs(:one)
  end

  test "visiting the index" do
    visit transcript_seqs_url
    assert_selector "h1", text: "Transcript Seqs"
  end

  test "creating a Transcript seq" do
    visit transcript_seqs_url
    click_on "New Transcript Seq"

    fill_in "Nuc sequence", with: @transcript_seq.nuc_sequence
    fill_in "Project", with: @transcript_seq.project_id
    fill_in "Transcript", with: @transcript_seq.transcript_id
    click_on "Create Transcript seq"

    assert_text "Transcript seq was successfully created"
    click_on "Back"
  end

  test "updating a Transcript seq" do
    visit transcript_seqs_url
    click_on "Edit", match: :first

    fill_in "Nuc sequence", with: @transcript_seq.nuc_sequence
    fill_in "Project", with: @transcript_seq.project_id
    fill_in "Transcript", with: @transcript_seq.transcript_id
    click_on "Update Transcript seq"

    assert_text "Transcript seq was successfully updated"
    click_on "Back"
  end

  test "destroying a Transcript seq" do
    visit transcript_seqs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transcript seq was successfully destroyed"
  end
end
