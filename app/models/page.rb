class Page < ActiveRecord::Base
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :created_pages

  def self.update_collaborators(collaborators_string)
    return [] if collaborators_string.blank?
    collaborators_string.split(",").map do |collaborator|
      User.find_by(email: collaborator.strip)
    end.compact
  end
  
  def make_public
    self.private = false
    save
    nil
  end

  def make_private
    self.private = true
    save
    nil
  end

  def private?
    self.private = true
  end

  def public?
    self.private = false
  end

end
