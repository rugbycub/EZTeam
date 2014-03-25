class City < ActiveRecord::Base
  belongs_to :stateprovence
  belongs_to :country
end
