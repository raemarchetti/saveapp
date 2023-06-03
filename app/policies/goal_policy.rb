class GoalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:user)
    end

    def new
      true
    end
  end
end
