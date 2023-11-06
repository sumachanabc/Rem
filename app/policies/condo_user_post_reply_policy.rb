class CondoUserPostReplyPolicy < ApplicationPolicy

  def create?
    return false if user.nil?
    user.admin? || user.manage? || user.employee? || user.id == record.condo_user_id
  end
  

  def update?
    create?
  end
end
