# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role_name == ::Role::ADMIN
      can :manage, :all
    elsif user.role_name == ::Role::MERCHANT
      can :manage, Transaction, user_id: user.id
    end
  end
end
