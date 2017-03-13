class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :create, User, id: user.id
      can :read, User, id: user.id
    end
  end
end