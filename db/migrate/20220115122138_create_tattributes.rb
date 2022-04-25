class CreateTattributes < ActiveRecord::Migration[6.1]
  def change
    create_table :tattributes do |t|
      t.integer :project_id
      t.string :transcriptid
      t.string :ttag
      t.string :tvalue

      t.timestamps
    end
  end
end
