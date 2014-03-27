class Team < ActiveRecord::Base
  resourcify
  belongs_to :club
  has_many :events, as: :group
  has_many :users_teams
  has_many :users, through: :users_teams
  belongs_to :league
end
