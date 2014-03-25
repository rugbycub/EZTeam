class Event < ActiveRecord::Base
  belongs_to :group, polymorphic: true
  belongs_to :venue
end
