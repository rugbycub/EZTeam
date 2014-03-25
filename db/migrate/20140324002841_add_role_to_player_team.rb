class AddRoleToPlayerTeam < ActiveRecord::Migration
  def change
    add_column :players_teams, :role, :string
  end
end
