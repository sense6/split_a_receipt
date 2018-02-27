class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :read, Group do |group|
        group.member?(user)
      end
      can :manage, Group do |group|
        user.admin?(group)
      end
    end
  end
end
