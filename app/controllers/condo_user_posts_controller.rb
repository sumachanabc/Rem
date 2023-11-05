class CondoUserPostsController < ApplicationController

  def index
    # 現在のユーザーに関連する Condo オブジェクトを取得
    @condo = current_condo_user.condo
  end

  def inquiries
    @condo_user_posts = CondoUserPost.where(condo_user: current_condo_user)
  end

  def new
  @condo = Condo.find(params[:condo_id])
  @condo_user_post = @condo.condo_user_posts.build
  end

  def create
    @condo = Condo.find(params[:condo_id])
    @condo_user_post = @condo.condo_user_posts.build(condo_user_post_params)
    if @condo_user_post.save
      redirect_to condo_condo_user_posts_path, notice: 'お問い合わせが送信されました'
    else
      render :new
    end
  end

  def show
    @condo_user_post = CondoUserPost.find(params[:id])
    @condo_user_post_replies = @condo_user_post.condo_user_post_replies # この行を追加
  end


private

  def condo_user_post_params
    params.require(:condo_user_post).permit(:title, :content, :image).merge(condo_user_id: current_condo_user.id)
  end

end