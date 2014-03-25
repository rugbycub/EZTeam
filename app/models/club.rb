class Club < ActiveRecord::Base
  has_many :teams
  has_many :events, as: :group
  has_many :users, through: :team
end
