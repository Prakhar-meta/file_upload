class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Redirect to new upload page after successful sign-up
  # def after_sign_up_path_for(resource)
  #   new_file_upload_path  # Redirect to the new upload page
  # end

  def after_sign_in_path_for(resource)
    Rails.logger.debug "Redirecting to new file upload page"
     new_file_upload_path  # Redirect to the new upload page
  end
end
