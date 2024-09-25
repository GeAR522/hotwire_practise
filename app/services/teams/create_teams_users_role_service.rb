module Teams
  class CreateTeamsUsersRoleService < ApplicationService
    def initialize(team:, current_user:)
      @team = team
      @current_user = current_user    
    end

    attr_reader :team
    attr_reader :current_user

    def call
      TeamsUsersRole.create!(team: team, user: current_user, role_id: TeamsUsersRole::ROLES.fetch("admin"))
    end
  end
end
