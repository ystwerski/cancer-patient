class CreateCancers < ActiveRecord::Migration
  def change
    create_table :cancers do |t|
      t.integer :patient_id
      t.string :cancer_type
      t.integer :age_of_diagnosis

      t.timestamps null: false
    end
  end
end
