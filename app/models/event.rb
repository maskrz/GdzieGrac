class Event < ActiveRecord::Base
  has_many :eplayers, :dependent => :delete_all
  has_many :players, :through => :eplayers
end
