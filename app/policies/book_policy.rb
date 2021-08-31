class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # user.admin? ? scope.all : scope.where(user: user)
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  # user ==> current_user
  # record_id ==> model
  def edit?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    record.user == user || user.admin
  end
end
