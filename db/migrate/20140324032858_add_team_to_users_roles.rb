class AddTeamToUsersRoles < ActiveRecord::Migration
  def change
    add_reference :users_roles, :team, index: true
  end
end
