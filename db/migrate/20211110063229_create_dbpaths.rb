class CreateDbpaths < ActiveRecord::Migration[6.1]
  def change
    create_table :dbpaths do |t|
      t.integer :project_id
      t.string :abbreviation
      t.string :sequence_type
      t.text :db_path

      t.timestamps
    end
  end
end
