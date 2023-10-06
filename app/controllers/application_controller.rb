class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_admin_authorization

  def check_admin_authorization
    if request.path.start_with?('/admin')
# 現在のパス(画面を開いた時のパス)が /admin で始まっているかどうかを判定
      authorize! :access_admin_page
# /admin で始まっていた場合、authorize! メソッドが実行されて :access_admin_page の ability を持っているかどうかチェック
    end
  end

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: '画面を閲覧する権限がありません。'
# ability を持っていないユーザーのアクセス = AccessDenied エラー発生 → 別の画面へ遷移
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana]
    )
  end
end