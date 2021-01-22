class Tag < ApplicationRecord
	has_many :chirp_tags
    has_many :tags, through: :chirp_tags
end
