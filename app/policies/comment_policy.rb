class CommentPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
      user.present?
  end

  def new?
    create?
  end

end