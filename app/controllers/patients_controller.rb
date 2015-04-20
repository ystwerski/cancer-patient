class PatientsController < ApplicationController
	before_action :authorize!

	def index
		if (current_user.patient == nil) && (!current_user.admin) 
			redirect_to new_patient_path
		elsif !current_user.admin
			redirect_to patient_path(@current_user.patient.id)
		end
		
		@patients = Patient.all



	end

	def new



	end

	def create

		first_name = params[:first_name]
		last_name = params[:last_name]
		date_of_birth = params[:date_of_birth]
		cancer_type = params[:cancer_type]
		age_of_diagnosis = params[:age_of_diagnosis]

		@patient = Patient.create({:first_name => first_name, :last_name => last_name, :date_of_birth => date_of_birth})
		
		if !current_user.admin
		current_user.update({:patient_id => @patient.id})
		end

		cancer = Cancer.create({:cancer_type => cancer_type, :age_of_diagnosis => age_of_diagnosis, :patient_id => @patient.id})
		

		if !current_user.admin
		redirect_to patient_path(@patient.id)
		else
		redirect_to patients_path
		end
	end

	def show


	end

	def edit

		@patient = Patient.find(params[:id])
		@cancers = @patient.cancers

	end


	def update
		first_name = params[:first_name]
		last_name = params[:last_name]
		date_of_birth = params[:date_of_birth]

		@patient = Patient.find(params[:id])

		@patient.update({:first_name => first_name, :last_name => last_name, :date_of_birth => date_of_birth})
		if !current_user.admin
		render 'show'
		else
		redirect_to patients_path
		end
	end

	def destroy
		@patient = Patient.find(params[:id])
		@cancers = @patient.cancers
		@patient.destroy
		@cancers.each do |cancer|
			cancer.destroy
		end
		if !current_user.admin
		redirect_to destroy_user_session_path
		else
		redirect_to patients_path
		end

	end


		

end
