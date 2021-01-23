class Tag < ApplicationRecord
	has_many :chirp_tags
    has_many :chirps, through: :chirp_tags
end
