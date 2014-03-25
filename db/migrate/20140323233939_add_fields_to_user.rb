class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile_phone, :string
    add_column :users, :emergency_contact_name, :string
    add_column :users, :emergency_contact_phone, :string
    add_column :users, :date_of_birth, :date
    add_attachment :users, :avatar
  end
end
