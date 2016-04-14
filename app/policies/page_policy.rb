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
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      pages = []
      if user.role == 2
        pages = scope.all # if the user is an admin, show them all the pages
      elsif user.role == 1
        all_pages = scope.all
        all_pages.each do |page|
          if page.creator == user || page.collaborators.include?(user)
            pages << page # if the user is premium, only show them public pages, or that private pages they created, or private pages they are a collaborator on
          end
        end
      else # this is the lowly standard user
        all_pages = scope.all
        pages = []
        all_pages.each do |page|
          if page.collaborators.include?(user)
            pages << page # only show standard users public pages and private pages they are a collaborator on
          end
        end
      end
      pages # return the pages array we've built up
    end
  end
end
