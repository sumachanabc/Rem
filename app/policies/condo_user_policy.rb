class CondoUserPolicy < ApplicationPolicy

  def index?
    user.admin? || user.manage? || user.employee?
  end

  def show?
    user.admin? || user.manage? || user.employee? || (user.condo_user? && user == record)
  end

  def create?
    user.admin? || user.manage?
  end

  def new?
    if user
      user.admin? || user.manage?
    else
      raise Pundit::NotAuthorizedError, '権限がありません。'
    end
  end

  def update?
    user.admin? || user.manage?
  end

  def edit?
    user.admin? || user.manage?
  end

  def destroy?
    user.admin? || user.manage?
  end
end
