class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :sport
      t.string :country
      t.string :city
      t.string :state
      t.integer :timezone

      t.timestamps
    end
  end
end
