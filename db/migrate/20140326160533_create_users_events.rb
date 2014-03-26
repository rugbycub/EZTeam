class CreateUsersEvents < ActiveRecord::Migration
  def change
    create_table :users_events do |t|
      t.references :user_id, index: true
      t.references :event_id, index: true
      t.string :status

      t.timestamps
    end
  end
end
