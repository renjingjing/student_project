class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    # When admin will be defined, un-comment it
    # if user.admin?
    #   can :manage, :all
    can :manage, CourseUnit do |course_unit|
      user.admin?
    end

    can :manage, CourseResource do |course_resouce|
      user.admin?
    end
    can :manage, Course do |course|
      user.admin?
    end
    can :manage, Kind do |kind|
      user.admin?
    end
    # else

    #  can :manage, CourseUnit do |unit|
    #    unit.user == user
    #  end

    #  can :manage, CourseResource do |resource|
    #    resource.unit.user == user || resource.user == user
    #  end

    # end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
