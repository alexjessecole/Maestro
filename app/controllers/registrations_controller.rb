class RegistrationsController < Devise::RegistrationsController

	protected
		def after_sign_up_path_for(resource)
			'/subscribers/new'
			#user_steps_path(:registration_success)
		end

end