class CondoUserPostsController < ApplicationController

  def index
    # 現在のユーザーに関連する Condo オブジェクトを取得
    @condo = current_condo_user.condo
  end

  def new
  end

  def create
  end
end
