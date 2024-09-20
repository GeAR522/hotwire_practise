class Team < ApplicationRecord

  validates :name, :location, :presence, :desc, :fee, :payment_frequency, :start_date, :active, presence: true

  validates :fee, numericality: { greater_than: 0, only_numeric: true }

end
