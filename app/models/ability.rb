class Ability
  include CanCan::Ability

  def initialize(user)
    # can :read, :all
    # # Define abilities for the passed in user here. For example:
    # #
    # user ||= User.new # guest user (not logged in)
    if user
      if user.admin
        can :manage, :all
        can :invite, User
      else
        can :access, :rails_admin
        can :dashboard
        can :manage, Restaurant, user_id: user.id
        can :manage, Post, user_id: user.id
        can :read, Review, status: :active
        can :manage, Claim, user_id: user.id
      end
    end
  end
end
