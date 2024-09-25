class CreateTeamsUsersRoles < ActiveRecord::Migration[7.2]
  def change
    create_table :teams_users_roles do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role_id, null: false

      t.timestamps
    end
  end
end
