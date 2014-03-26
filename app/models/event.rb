class Event < ActiveRecord::Base
  belongs_to :group, polymorphic: true
  has_one :venue

  has_many :users_events
  has_many :users, through: :users_events
end
