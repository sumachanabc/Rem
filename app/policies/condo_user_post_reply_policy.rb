class CondoUserPostReplyPolicy < ApplicationPolicy
  def create?
    user.admin? || user.manage? || user.employee? || user.id == record.condo_user_id
  end

  def update?
    create?
  end
end
