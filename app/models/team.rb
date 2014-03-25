class Team < ActiveRecord::Base
  belongs_to :club
  has_many :events, as: :group
  has_and_belongs_to_many :user , :join_table => :users_roles
end
