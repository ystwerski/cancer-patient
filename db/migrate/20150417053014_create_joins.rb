class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :patient_id
      t.integer :cancer_id

      t.timestamps null: false
    end
  end
end
