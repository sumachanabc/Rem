class NotificationsController < ApplicationController

  def index
    user_or_condo_user = current_user || current_condo_user
    
    if user_or_condo_user
      @notifications = user_or_condo_user.visited_notifications.order(created_at: :desc)
    else
      redirect_to root_path, alert: 'ログインが必要です。'
    end
  end

  def mark_as_read_and_redirect
    notification = Notification.find(params[:id])
    notification.update(checked: true) unless notification.checked
    redirect_to appropriate_path(notification)
  end

  private

  def appropriate_path(notification)
    if notification.action == 'comment'
      comment = notification.condo_user_post_reply
      post = comment.condo_user_post
      condo_condo_user_post_path(post.condo_id, post.id)
    elsif notification.action == 'posted'
      condo_user_post = notification.condo_user_post
      condo_condo_user_post_path(condo_user_post.condo_id, condo_user_post.id)
    else
    end
  end
end
