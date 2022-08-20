# frozen_string_literal: true

class Ability # rubocop:todo Style/Documentation
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # support guest user ie users not logged in
    can :read, Recipe, public: true

    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :read, User # all users can view
    can :manage, Recipe, user: user # only owners can manage posts
    can :manage, Food, user: user # only owners can manage posts
    can :manage, RecipeFood, user: # only owners can manage posts
  end
end
