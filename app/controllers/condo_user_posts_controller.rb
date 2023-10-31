class CondoUserPostsController < ApplicationController

  def index
    # 現在のユーザーに関連する Condo オブジェクトを取得
    @condo = current_condo_user.condo
  end

  def new
  @condo = Condo.find(params[:condo_id])
  @condo_user_post = @condo.condo_user_posts.build
  end

  def create
    @condo_user_post = CondoUserPost.new(condo_user_post_params)
    if @condo_user_post.save
      redirect_to some_path, notice: 'お問い合わせが送信されました'
    else
      render :new
    end
  end

private

  def condo_user_post_params
    params.require(:condo_user_post).permit(:title, :content).merge(condo_user_id: current_condo_user.id)
  end

end