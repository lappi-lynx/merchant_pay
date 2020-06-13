# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.merchant?
      can :manage, Transaction, user_id: user.id
      can %i[read update], Merchant, id: user.id
      cannot :index, Merchant
    end
  end
end
