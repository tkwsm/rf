class CreateAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :attributes do |t|
      t.integer :project_id
      t.string :geneid
      t.string :gtag
      t.string :gvalue

      t.timestamps
    end
  end
end
