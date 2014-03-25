class DeleteJoinTablePlayersTeam < ActiveRecord::Migration
  def change
    drop_join_table :players, :teams
  end
end
