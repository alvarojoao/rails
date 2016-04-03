class Place < ActiveRecord::Base
  	belongs_to :targeting
	validates :address, presence: true
end
