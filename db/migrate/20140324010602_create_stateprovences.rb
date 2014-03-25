class CreateStateprovences < ActiveRecord::Migration
  def change
    create_table :stateprovences do |t|
      t.string :code
      t.string :name
      t.references :country, index: true

      t.timestamps
    end
  end
end
