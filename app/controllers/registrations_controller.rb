class RegistrationsController < Devise::RegistrationsController

	def create
		super
	end

	

	protected
		def after_sign_up_path_for(resource)
			user_steps_path(:registration_success)
		end

end