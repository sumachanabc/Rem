class CondoUserPostsController < ApplicationController

  def index
    # 現在のユーザーに関連する Condo オブジェクトを取得
    @condo = current_condo_user.condo
  end

  def new
    @condo_user_post = CondoUserPost.new
  end

  def create
    CondoUserPost.create(condo_user_post_params)
    redirect_to root_path
  end
end

private

def condo_user_post_params
  params.require(:condo_user_post).permit(:image, :text).merge(condo_user_id: current_condo_user.id)
end