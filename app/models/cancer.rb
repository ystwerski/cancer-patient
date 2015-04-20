class Cancer < ActiveRecord::Base
	validates :cancer_type, :presence => :true
	validates :age_of_diagnosis, :presence => true
	validates :age_of_diagnosis, :numericality => true

	belongs_to :patient


end
