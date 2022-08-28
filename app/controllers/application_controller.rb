class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters #deviseのストロングパラメーター
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_out_path_for(resource) #deviseのログアウト後に繊維するページの指定
    new_user_session_path
  end
end
