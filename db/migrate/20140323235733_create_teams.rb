class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :club, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
