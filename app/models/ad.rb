class Ad < ActiveRecord::Base
	has_many :targetings
	has_many :creatives
end
