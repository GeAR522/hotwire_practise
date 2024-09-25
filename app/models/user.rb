class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teams_users_roles
  has_many :teams, through: :teams_users_roles

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }

  def full_name
    "#{first_name} #{last_name}"
  end

end
