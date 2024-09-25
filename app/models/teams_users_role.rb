class TeamsUsersRole < ApplicationRecord

  ROLES = {
    "admin" => 1,
    "coach" => 2,
    "member" => 3,
  }.freeze

  belongs_to :team
  belongs_to :user

  validates :role_id, :user_id, :team_id, presence: true
  validates :role_id, inclusion: { in: ROLES.values }
end
