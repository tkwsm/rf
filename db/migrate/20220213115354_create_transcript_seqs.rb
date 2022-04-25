class CreateTranscriptSeqs < ActiveRecord::Migration[6.1]
  def change
    create_table :transcript_seqs do |t|
      t.integer :project_id
      t.string :transcript_id
      t.text :nuc_sequence

      t.timestamps
    end
  end
end
