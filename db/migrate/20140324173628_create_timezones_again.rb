class CreateTimezonesAgain < ActiveRecord::Migration
  def change
    create_table :timezones, :id => false do |t|
      t.primary_key :gmt_offset
      t.string :name

      t.timestamps
    end
  end
end
