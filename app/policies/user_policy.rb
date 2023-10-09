class UserPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    if user
      user.admin? # userがnilでない場合にadmin?メソッドを呼ぶ
    else
      raise Pundit::NotAuthorizedError, '権限がありません。'
    end
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end