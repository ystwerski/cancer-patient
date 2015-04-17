class PatientsController < ApplicationController
	before_action :authorize!

	def index
		if (current_user.patient == nil) && (!current_user.admin) 
			redirect_to new_patient_path
		elsif !current_user.admin
			redirect_to patient_path
		end
				

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

		current_user.update({:patient_id => @patient.id})

		@cancer = Cancer.create({:cancer_type => cancer_type, :age_of_diagnosis => age_of_diagnosis, :patient_id => @patient.id})

		redirect_to patient_path(@patient.id)
	end

	def show

		@patient = Patient.find(params[:id])
		@cancers = @patient.cancers

	end

	def edit

		@patient = Patient.find(params[:id])
		@cancers = @patient.cancers

	end


	def update
		first_name = params[:first_name]
		last_name = params[:last_name]
		date_of_birth = params[:date_of_birth]

		Patient.find(params[:id]).update({:first_name => first_name, :last_name => last_name, :date_of_birth => date_of_birth})
		
		@patient = Patient.find(params[:id])

		@cancers = @patient.cancers
		render 'show'

	end

	def destroy
		@patient = Patient.find(params[:id])
		@cancers = @patient.cancers
		@patient.destroy
		@cancers.each do |cancer|
			cancer.destroy
		end
		redirect_to destroy_user_session_path

	end


		

end
