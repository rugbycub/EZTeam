class Club < ActiveRecord::Base
  has_many :teams, :class_name => 'Team'
  has_many :events, as: :group
  has_many :users, through: :team
  has_one  :timezone, :class_name => 'Timezone', :foreign_key => :timezone
end
