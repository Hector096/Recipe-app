class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Food
    can :read, Recipe, public: true
    can :manage, Food, user: user
    can :manage, Recipe, user: user
    return unless user

    can :manage, Ingredient if user
  end
end
