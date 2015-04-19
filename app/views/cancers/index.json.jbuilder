json.cancer @cancers do |cancer|
	json.id cancer.id
	json.cancer_type cancer.cancer_type
	json.age_of_diagnosis cancer.age_of_diagnosis
	json.patient_id cancer.patient_id
end