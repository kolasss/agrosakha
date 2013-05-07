class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :show_category, [Sell, Buy]
      can :show_subcategory, [Sell, Buy]
      cannot :index, User
      # can :show2, Grant
      # can :show2, Grantcorp
      # can :create, Comment
      # can :update, Comment do |comment|
      #   comment.try(:user) == user || user.role?(:moderator)
      # end
      if user.has_role?(:guest)
        can :manage, Profile, :user_id => user.id
      elsif user.has_role?(:user)
        can :manage, [Buy, Sell, Profile], :user_id => user.id
        # can [:update, :destroy], [Buy, Sell, Profile], :user_id => user.id
        # can [:update, :destroy], Sell, :user_id => user.id
        # can [:update, :destroy], Profile, :user_id => user.id
        # can :manage, Profile, :user_id => user.id
        # can [:update, :destroy], Profile, :user_id => user.id
      end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
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
