class CondoUserPostRepliesController < ApplicationController
  before_action :set_condo_user_post, only: [:create]
  before_action :set_reply, only: [:update]

  def create
    # current_user または current_condo_user が存在するか確認
    if current_user.nil? && current_condo_user.nil?
      redirect_to some_path, alert: 'ログインが必要です'
      return
    end

    # @reply を初期化し、ユーザー情報を設定
    @reply = @condo_user_post.condo_user_post_replies.build(reply_params)
    @reply.user = current_user if current_user
    @reply.condo_user = current_condo_user if current_condo_user

    if @reply.save
      redirect_to [@condo_user_post.condo, @condo_user_post], notice: 'コメントが投稿されました'
    else
      puts @reply.errors.full_messages # これでエラーメッセージを確認できます
      redirect_to [@condo_user_post.condo, @condo_user_post], alert: 'コメントの保存に失敗しました'
    end
  end

  private

  def set_condo_user_post
    @condo_user_post = CondoUserPost.find(params[:condo_user_post_id])
  end

  def set_reply
    @reply = CondoUserPostReply.find(params[:id])
  end

  def reply_params
    params.require(:condo_user_post_reply).permit(:content)
  end

end