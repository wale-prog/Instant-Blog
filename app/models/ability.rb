# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    return unless user.present? 
    can :read, Post, author_id: user.id

    return unless user.role?  
    can :read, Post
  end
end
