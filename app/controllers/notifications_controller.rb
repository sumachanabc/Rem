class NotificationsController < ApplicationController

  def index
    user_or_condo_user = current_user || current_condo_user
    
    if user_or_condo_user
      @notifications = user_or_condo_user.visited_notifications.order(created_at: :desc)
    else
      redirect_to root_path, alert: 'ログインが必要です。'
    end
  end

  def mark_all_as_read
    current_user.visited_notifications.unread.update_all(checked: true)
    respond_to do |format|
      format.html { redirect_to notifications_path, notice: '全ての通知を既読にしました。' }
      format.js # JavaScriptのレスポンスを処理する場合
    end
  end
end
