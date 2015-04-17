class CancersController < ApplicationController
	before_action :authorize!


	def new

	end

	def create

	end

	def show

	end

	def edit

		@cancer = Cancer.find(params[:id])

	end


	def update
		cancer_type = params[:cancer_type]
		age_of_diagnosis = params[:age_of_diagnosis]

		cancer = Cancer.find(params[:id])
		cancer.update({:cancer_type => cancer_type, :age_of_diagnosis => age_of_diagnosis})
		@patient = cancer.patient
		@cancers = @patient.cancers
		render "patients/show"

	end

	def destroy

	end

end
