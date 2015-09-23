class UserStepsController < Wicked::WizardController
 
  steps :registration_success

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    render_wizard @user
  end

  def finish_wizard_path
  flash[:notice] = "You have successfully Registered With The Wizard."
  user_path(current_user)
  end

private

  def user_params
    params.require(:user).permit(:fname, :email, :password)
  end
end