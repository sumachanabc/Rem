# frozen_string_literal: true

class CondoUsers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @condo_user = CondoUser.new
    # マンションの選択肢を取得
    @condos_for_select = condos_for_select
    # 初期選択のマンションIDを設定（任意の初期値）
    @selected_condo_id = Condo.first.id # 最初のマンションIDを選択
    authorize @condo_user
    # 新規登録画面の表示
    render 'new'
  end

  # POST /resource
  def create
    if current_user.admin? || current_user.manage?
      # CondoUserを保存
      @condo_user = CondoUser.new(condo_user_params)
      authorize @condo_user

      # マンションの選択肢を取得
      @condos_for_select = condos_for_select

      if @condo_user.save
        redirect_to root_path notice: 'CondoUser was successfully created.'
      else
        render :new
      end

    else
      flash[:alert] = '権限がありません。'
      redirect_to root_path
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def condos_for_select
    Condo.all.map { |condo| [condo.condo_name, condo.id] }
  end

  def condo_user_params
    params.require(:condo_user).permit(
      :email, :password, :password_confirmation, :condo_id,
      :room_number, :condo_user_last_name, :condo_user_first_name,
      :condo_user_last_name_kana, :condo_user_first_name_kana,
      :condo_user_address, :condo_user_phone_number
    )
  end
end
