class NotificationsController < ApplicationController

  def index
    @visited_notifications = current_user.visited_notifications
    @visitor_notifications = current_user.visitor_notifications
    @notifications = @visited_notifications + @visitor_notifications
  end

  def mark_all_as_read
    current_user.visited_notifications.unread.update_all(checked: true)
    respond_to do |format|
      format.html { redirect_to notifications_path, notice: '全ての通知を既読にしました。' }
      format.js # JavaScriptのレスポンスを処理する場合
    end
  end
end
