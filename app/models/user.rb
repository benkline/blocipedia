class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :pages

  enum role: {standard: 0, premium: 1, admin: 2 }

  def upgrade
    self.role = :premium
    save
    nil
  end

  def downgrade
    self.role = :standard
    self.pages.each {|page| page.make_public }
    save
    nil
  end

  def make_admin
    self.role = :admin
    save
    nil
  end

end
