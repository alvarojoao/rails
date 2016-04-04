class Ad < ActiveRecord::Base
	has_many :targetings, dependent: :destroy
	has_many :creatives, dependent: :destroy
	validates :budget, presence: true, :numericality => { :greater_than => 0}
end
