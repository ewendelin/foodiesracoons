class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.kind == "manager"
        can :access, :rails_admin
        can :dashboard
        can :manage, Restaurant, user_id: user.id
        can :manage, Post, user_id: user.id
        can :read, Review, status: :active
        can :manage, Claim, user_id: user.id
      end
      elsif user.kind == "admin"
        can :manage, :all
        can :invite, User
    end
  end
end
