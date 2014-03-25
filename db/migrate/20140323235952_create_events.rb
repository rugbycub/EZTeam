class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :group, polymorphic: true, index: true
      t.string :type
      t.string :opponent
      t.date :event_date
      t.time :starting_time
      t.time :ending_time
      t.boolean :recurring
      t.integer :frequency
      t.string :timeframe
      t.references :venue, index: true

      t.timestamps
    end
  end
end
