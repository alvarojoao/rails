class Targeting < ActiveRecord::Base
	belongs_to :ad
	has_many :places
	enum genero: [ :masculino, :feminino, :indeterminado ]
end
