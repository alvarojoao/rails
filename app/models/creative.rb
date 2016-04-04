class Creative < ActiveRecord::Base
	belongs_to :ad
	validates :adText, presence: true
	validates :bid, presence: true
	validates_numericality_of :bid, less_than: ->(creative) { creative.ad.budget }
end
