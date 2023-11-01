class CondosController < ApplicationController
  before_action :set_condo, only: [:show, :details, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @condos = Condo.all
    authorize @condos
  end

  def show
    authorize @condo
  end

  def details
    authorize @condo
  end

  def inquiries
    @condo = Condo.find(params[:id])
    @condo_user_posts = @condo.condo_user_posts.order(created_at: :desc)
  end

  def new
    @condo = Condo.new
    @users_for_select = users_for_select
    @selected_user_id = User.first.id
    authorize @condo
  end
  

  def create
    # 他のユーザーのIDをパラメータから受け取る
    user_id = params[:condo][:user_id] # 例: params[:condo][:user_id] で選択されたユーザーのIDを取得する
  
    # このユーザーが admin または manage 権限を持っているかチェック
    if current_user.admin? || current_user.manage?
      # ユーザーが admin または manage の場合、投稿を作成し、他のユーザーと紐付ける
      @condo = Condo.new(condo_params)
      @condo.user_id = user_id # 他のユーザーのIDを投稿に紐付ける

      # create アクションに対する認可を実行
      authorize @condo

      @users_for_select = users_for_select
      @selected_user_id = user_id

      if @condo.save
        redirect_to root_path notice: 'Condo was successfully created.'
      else
        render :new
      end
    else
      flash[:alert] = '権限がありません。'
      redirect_to root_path
    end
  end
  

  def edit
    authorize @condo
  end

  def update
    authorize @condo
    if @condo.update(condo_params)
      redirect_to @condo, notice: 'Condo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @condo
    @condo.destroy
    redirect_to root_path, notice: 'Condo was successfully destroyed.'
  end

  private

  def set_condo
    @condo = Condo.find(params[:id])
  end

  def condo_params
    params.require(:condo).permit(
      :condo_name, :postal_code, :condo_address, :floor, :basement_floor,
      :total_number_of_unit, :completion_year, :structure_id,
      :site_area, :total_floor_area, :management_type_id,
      :management_company_name, :management_company_postal_code,
      :management_company_address, :management_company_phone_number,
      :parking_space,:bicycle_parking_space, :maintenance_fee,
      :repair_reserve_fund,:user_id
    )
  end

  # 例: ユーザー一覧を取得するメソッド。ビューで使用する
  def users_for_select
    User.all.map { |user| ["#{user.last_name} #{user.first_name}", user.id] }
  end
  

end
