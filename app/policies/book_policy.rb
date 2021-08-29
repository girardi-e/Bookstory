class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope ==> class
      scope.all
      # scope.where(user: user)
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
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
