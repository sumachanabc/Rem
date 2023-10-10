class CondoPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def details?
    true
  end

  def create?
    user.admin? || user.manage?
  end

  def new?
    user.admin? || user.manage?
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