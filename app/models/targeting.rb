class Targeting < ActiveRecord::Base
  belongs_to :ad
  serialize :places
  enum genero: [ :masculino, :feminino, :indeterminado ]
end
