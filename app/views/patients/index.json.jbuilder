json.patients @patients do |patient|
	
	json.id patient.id
	json.first_name patient.first_name
	json.last_name patient.last_name
	json.date_of_birth patient.date_of_birth

	json.cancers patient.cancers do |cancer|
		json.id cancer.id
		json.cancer_type cancer.cancer_type
		json.age_of_diagnosis cancer.age_of_diagnosis
	end 

end