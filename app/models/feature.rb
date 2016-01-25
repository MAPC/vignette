class Feature < ActiveRecord::Base
	has_many :bricks, -> { order(position: :asc) }

	accepts_nested_attributes_for :bricks
end
