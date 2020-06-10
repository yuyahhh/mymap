class UsersController < ApplicationController
  def create
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :birth_year_id, :birth_month_id, :birth_day_id, :nickname])
  end
end
