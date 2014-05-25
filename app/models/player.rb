class Player < ActiveRecord::Base
  has_many :eplayers, :dependent => :delete_all
  has_many :events, :through => :eplayers
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  def display_name
    name + " " + surname
  end
end
