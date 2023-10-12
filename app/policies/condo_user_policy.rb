class CondoUserPolicy < ApplicationPolicy
  def show?
    # ロジックに応じてアクセスを許可するか判断
    # 例: ログインユーザーは常にアクセスを許可する場合
    true
  end

  # 他のアクションに対するポリシーも定義
end