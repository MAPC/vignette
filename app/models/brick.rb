class Brick < ActiveRecord::Base
	extend Enumerize
	has_many :narratives
	belongs_to :feature

	scope :mastheads, -> { where(masthead: true) }
	scope :regular_bricks, -> { where(masthead: false) }

	# default_scope { order order: :asc }
	# before_save :increment_siblings

	enumerize :brick_type, in: [:narrative, :image, :chart, :map, :social, :blank], default: :blank

	acts_as_list scope: :feature

	def widened_class
		if self.wide
			"sixteen"
		else
			"eight"
		end
	end
end
