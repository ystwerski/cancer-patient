class LinkingUsersToPatients < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.integer :patient_id
  	end
  end
end
