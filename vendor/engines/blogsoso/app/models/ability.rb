# -*- encoding : utf-8 -*-
module Blogsoso
  class Ability < ::LoyalPassport::Ability
    def initialize ability, current_user

      #  ability.can [
      #    :create_xiuxian123_juice_candy,
      #    :create_xiuxian123_juice_box
      #  ], [::User] do |user|
      #    current_user.id == user.id
      #  end

      #  ability.can :read, ::Xiuxian123::Juice::Candy

      #  ability.can [:update, :destroy], [
      #    ::Xiuxian123::Comment,
      #    ::Xiuxian123::Juice::Candy,
      #    ::Xiuxian123::Juice::Bag,
      #    ::Xiuxian123::Juice::Box
      #  ] do |target|
      #    target.creator_is?(current_user)
      #  end

      # Define abilities for the passed in user here. For example:
      #
      #   current_user ||= User.new # guest user (not logged in)
      #   if current_user.admin?
      #     can :manage, :all
      #   else
      #     can :read, :all
      #   end
      #
      # The first argument to `can` is the action you are giving the user permission to do.
      # If you pass :manage it will apply to every action. Other common actions here are
      # :read, :create, :update and :destroy.
      #
      # The second argument is the resource the user can perform the action on. If you pass
      # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
      #
      # The third argument is an optional hash of conditions to further filter the objects.
      # For example, here the user can only update published articles.
      #
      #   can :update, Article, :published => true
      #
      # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    end
  end
end
