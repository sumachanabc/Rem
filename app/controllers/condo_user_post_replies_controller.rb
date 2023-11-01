class CondoUserPostRepliesController < ApplicationController
  before_action :set_condo_user_post, only: [:create]
  before_action :set_reply, only: [:update]

  def create
    @reply = @condo_user_post.condo_user_post_replies.new(reply_params)
    authorize @reply

    if @reply.save
      # 画像を添付する場合
      @reply.images.attach(params[:condo_user_post_reply][:images]) if params[:condo_user_post_reply][:images].present?

      redirect_to condo_user_post_path(@condo_user_post), notice: 'コメントが追加されました'
    else
      render 'condo_user_posts/show'
    end
  end

  def update
    authorize @reply

    if @reply.update(reply_params)
      # 画像を添付する場合
      @reply.images.attach(params[:condo_user_post_reply][:images]) if params[:condo_user_post_reply][:images].present?

      redirect_to condo_user_post_path(@reply.condo_user_post), notice: 'コメントが更新されました'
    else
      render 'condo_user_posts/show'
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
    params.require(:condo_user_post_reply).permit(:content, images: [])
  end
end

