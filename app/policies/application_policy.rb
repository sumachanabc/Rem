# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
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

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
