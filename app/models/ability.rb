class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Post
  end
end
