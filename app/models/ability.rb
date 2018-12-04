class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      can :invite, User
    else
      # can :manage, Promotion, user_id: user.id
    end
  end
end
