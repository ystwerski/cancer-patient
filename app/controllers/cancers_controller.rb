class CancersController < ApplicationController
	before_action :authorize!


	def index
		@cancers= Cancer.all
	end

	def new
		if current_user.admin
		@patient_id = params[:patient_id]
		end
	end

	def create
		cancer_type = params[:cancer_type]
		age_of_diagnosis = params[:age_of_diagnosis]
		if current_user.admin == false
			patient_id = current_user.id
		elsif current_user.admin
			patient_id = params[:patient_id]
		end

		@cancer = Cancer.create({:cancer_type => cancer_type, :age_of_diagnosis => age_of_diagnosis, :patient_id => patient_id})
		if !current_user.admin
		render 'patients/show'
		end
		redirect_to patients_path
	end


	def edit

		@cancer = Cancer.find(params[:id])

	end


	def update
		cancer_type = params[:cancer_type]
		age_of_diagnosis = params[:age_of_diagnosis]

		cancer = Cancer.find(params[:id])
		cancer.update({:cancer_type => cancer_type, :age_of_diagnosis => age_of_diagnosis})
		if !current_user.admin
		render "patients/show"
		end
		redirect_to patients_path
	end

	def destroy

		cancer = Cancer.find(params[:id])
		cancer.destroy
		if !current_user.admin
		redirect_to patient_path(current_user.patient.id)
		end
		redirect_to patients_path
	end

end
