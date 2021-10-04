class CreateGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.string :species_name
      t.string :common_name
      t.text :description
      t.string :version
      t.text :url_link
      t.integer :sort_number
      t.string :image_link
      t.string :ncbi_taxonomy_id

      t.timestamps
    end
  end
end
