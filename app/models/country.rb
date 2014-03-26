class Country < ActiveRecord::Base
      self.primary_key = :country_code

    has_many :stateprovences, :class_name => 'Stateprovence' 
end
