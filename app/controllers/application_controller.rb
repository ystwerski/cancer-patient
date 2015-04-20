class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception


  	def authorize!

		if !current_user
			flash[:danger] = "You must sign in before entering the site"
			redirect_to new_user_session_path
		end
		
	end

	

end
