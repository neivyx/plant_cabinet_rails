class User < ApplicationRecord
    has_many :plants
    has_many :reviews
    has_many :reviewed_plants, -> { distinct }, through: :reviews, source: :plant
    has_secure_password  #authenticate, validate password &/or password confirmation

end
