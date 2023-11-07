class CondoUserPostReplyPolicy < ApplicationPolicy

  def create?
    true
  end
  

  def update?
    create?
  end
end
