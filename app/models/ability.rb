class Ability
  include CanCan::Ability

  def initialize(user)
    raise if user.nil?

    return unless user && (user.manager? || user.admin?)

    if user.manager?
      can :access, :rails_admin
      can :dashboard
      can :manage, Restaurant, user_id: user.id
      can :manage, Post, restaurant: {user_id: user.id}
      can :manage, Claim, post: {restaurant: {user_id: user.id}}
      # can :manage, Review, post: {restaurant: {user_id: user.id}}
    end

    if user.admin?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      can :invite, User

    end
  end
end
