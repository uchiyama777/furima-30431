class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day])
  end
end
