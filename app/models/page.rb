class Page < ActiveRecord::Base
  belongs_to :user

  scope :priv, -> { where(private: true) }
  scope :pub, -> { where(private: false) }

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

end
