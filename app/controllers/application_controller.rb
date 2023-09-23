class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # def after_sign_up_path_for(_resource)
  #   companies_articles_path(show(params[:id]))
  # end

  # def create
  #   flash[:notice] = "successfully"
  # end

  # def update
  #   flash[:notice] = "successfully"
  # end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end
