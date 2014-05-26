class Field < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  def desc
    name + ", koszy: "+ number_of_baskets.to_s
    
  end
end
