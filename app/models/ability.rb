class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # permissions for every user, even if not logged in
    return unless user && user.type == 'Expert'
    can :manage, :all
  end
end
