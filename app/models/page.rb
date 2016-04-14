class Page < ActiveRecord::Base
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :created_pages

  # scope :pub, -> { where(private: false) }
  # scope :priv, -> { where(private: true) }

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
