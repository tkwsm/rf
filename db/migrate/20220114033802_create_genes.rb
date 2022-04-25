class CreateGenes < ActiveRecord::Migration[6.1]
  def change
    create_table :genes do |t|
      t.integer :project_id
      t.string :seqid
      t.string :gsource
      t.string :gtype
      t.integer :gstart
      t.integer :gend
      t.float  :gscore
      t.string :gstrand
      t.string :gphase
      t.string :geneid

      t.timestamps
    end
  end
end
