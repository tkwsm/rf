class CreateProteinSeqs < ActiveRecord::Migration[6.1]
  def change
    create_table :protein_seqs do |t|
      t.integer :project_id
      t.string :proteinid
      t.text :prot_sequence

      t.timestamps
    end
  end
end
