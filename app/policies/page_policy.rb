class PagePolicy < ApplicationPolicy
attr_reader :user, :page

  def initialize(user, page)
    @user = user
    @page = page
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    true
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
