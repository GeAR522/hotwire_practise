class Team < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  has_many :teams_users_roles
  has_many :users, through: :teams_users_roles

  PAY_FREQUENCIES = {
    1 => "weekly", 
    2 => "monthly", 
    3 => "quarterly", 
    4 => "annually"
  }.freeze

  validates :name, :location, :desc, :fee, :payment_frequency, :start_date, :active, presence: true

  # validates :fee, numericality: { greater_than: 0, only_numeric: true }

  def payment_frequency_options
    PAY_FREQUENCIES.map do |key, value|
      return [key, value]
    end
  end

  def creator
    self.users.joins(:teams_users_roles).where(teams_users_roles: { role_id: TeamsUsersRole::ROLES.fetch("admin") }).first&.full_name
  end

  def pay_freq
    PAY_FREQUENCIES.fetch(self.payment_frequency.to_i)
  end

end
