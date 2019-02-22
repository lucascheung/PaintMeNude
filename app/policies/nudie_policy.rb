class NudiePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    current_user_or_admin?
  end

  def destroy?
    current_user_or_admin?
  end

  def male_filter?
    return true
  end

  def female_filter?
    return true
  end

  private

  def current_user_or_admin?
    record.user == user || user.admin
  end
end
