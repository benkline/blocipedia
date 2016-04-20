class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :collaborations
  has_many :collaborating_pages, through: :collaborations, source: :page

  has_many :created_pages, class_name: 'Page', foreign_key: "user_id", inverse_of: :creator

  #delegate :pages, to: :collaborators

  enum role: {standard: 0, premium: 1, admin: 2 }

  def upgrade
    self.role = 1
    save
    nil
  end

  def downgrade
    self.role = 0
    self.created_pages.each {|page| page.make_public }
    save
    nil
  end

  def make_admin
    self.role = 2
    save
    nil
  end



end
