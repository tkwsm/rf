class CreateProteins < ActiveRecord::Migration[6.1]
  def change
    create_table :proteins do |t|
      t.integer :project_id
      t.string :seqid
      t.string :gsource
      t.string :gtype
      t.string :proteinid
      t.string :parentid

      t.timestamps
    end
  end
end
