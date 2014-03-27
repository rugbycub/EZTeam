class Stateprovence < ActiveRecord::Base

    self.primary_key = :code

    belongs_to :country, :class_name => 'Country', :foreign_key => :country_id    
end
