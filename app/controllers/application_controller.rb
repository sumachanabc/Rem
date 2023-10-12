class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization
  # Punditを適用するcontrollerの継承元でincludeする。

  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when CondoUser
      # ネストされたリソースのため、condo_id を指定する
      condo_condo_user_posts_path(condo_id: current_condo_user.condo.id)
    end
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def authenticate
    if current_user
      # Userがログインしている場合
      authenticate_user!
    elsif current_condo_user
      # CondoUserがログインしている場合
      authenticate_condo_user!
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana]
    )
  end
end