class ChirpTag < ApplicationRecord
	belongs_to :chirp
    belongs_to :tag
end
