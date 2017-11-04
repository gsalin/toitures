class RegistrationsController < Devise::RegistrationsController

  # def status
  #   @query_parameters = request.query_parameters
  # end

  def after_sign_up_path_for(resource)
    if @user.status = "pro" || @user.status = "institution"
      edit_user_path(current_user)
    else
      new_job_ad_path(current_user)
    end
  end
end
