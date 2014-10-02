module DevisePermittedParameters
  extend ActiveSupport::Concern
  
  included do
    before_filter :configure_permitted_parameters
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :account_number << :email
    devise_parameter_sanitizer.for(:sign_in) << :account_number << :password << :remember_me
    devise_parameter_sanitizer.for(:account_update) << :name << :account_number << :email
  end
end