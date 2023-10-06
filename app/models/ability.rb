# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # role が admin のユーザーはモデルの操作を行うことができて管理者画面を閲覧可能
    if user.has_role?(:admin)
      can :manage, :all
      can :access_admin_page, :all

    # role が manager のユーザーはモデルの操作を行うことができるが、管理者画面は閲覧不可能
    elsif user.has_role?(:manager)
      can :manage, :all
      cannot :access_admin_page, :all

    # role が read_only のユーザーはモデルの操作を行うことができず閲覧のみ可能、管理者画面は閲覧不可能
    elsif user.has_role?(:read_only)
      can :read, :all
      cannot :access_admin_page, :all

    # role を持っていないユーザーは全ての画面が閲覧不可能
    else
      cannot :read, :all
    end
  end
end

    # 例えばこのようにして ability を定義します。
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # can の第一引数には :read, :create, :update, :destroy を定義します。
    # manage を渡すとこれらの4つ全てが有効になります。
    
    # can の第二引数には、第一引数で設定したアクションを実行できるモデルを設定します。
    # :all を渡すと全てのモデルが対象になります。
    
    # can の第三引数ではさらに追加の設定を行うことができます。
    
    # 詳しくは wiki をご覧ください。
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

