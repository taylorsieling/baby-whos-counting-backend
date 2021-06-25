class Song < ApplicationRecord
    has_many :rankings
    belongs_to :album
end
