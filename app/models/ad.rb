class Ad < ActiveRecord::Base
	has_many :targetings
	has_many :creatives
	validates :budget, presence: true, :numericality => { :greater_than => 0}
end
