class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # permissions for every user, even if not logged in
    return unless user
    can :create, Comment do |c|
      c.campaign.exists?
    end
    return unless user && user.type == 'Expert'
    can :manage, Campaign
    can :update, Novice
    can :create, Comment
  end
end
