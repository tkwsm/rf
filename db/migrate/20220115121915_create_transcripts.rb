class CreateTranscripts < ActiveRecord::Migration[6.1]
  def change
    create_table :transcripts do |t|
      t.integer :project_id
      t.string :seqid
      t.string :gsource
      t.string :gtype
      t.integer :gstart
      t.integer :gend
      t.integer :gscore
      t.string :gstrand
      t.string :gphase
      t.string :transcriptid
      t.string :parentid

      t.timestamps
    end
  end
end
