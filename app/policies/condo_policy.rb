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

  def inquiries?
    # userがnilでなく、adminかmanageのロールを持っているか、物件の担当である場合にtrueを返す
    user && (user.admin? || user.manage? || user_is_property_manager?)
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

  private

  def user_is_property_manager?
    # userとcondoが同じ外部キー（user_id）を持っている場合にtrueを返す
    record.user_id == user.id
  end

end