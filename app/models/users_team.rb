class UsersTeam < ActiveRecord::Base



    belongs_to :user, :class_name => 'User', :foreign_key => :user_id    
    belongs_to :team, :class_name => 'Team', :foreign_key => :team_id    
end
