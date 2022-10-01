class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.present?

    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id
    return unless user.admin?

    can :manage, :all
  end
end
