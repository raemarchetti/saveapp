# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    is_owner?
  end

  def show?
    is_owner?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    is_owner?
  end

  def edit?
    update?
  end

  def destroy?
    is_owner?
  end

  private
  def is_owner?
    record.user == user
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
