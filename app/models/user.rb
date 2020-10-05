class User < ApplicationRecord
    has_many :plants
    has_many :reviews
    has_many :reviewed_plants, -> { distinct }, through: :reviews, source: :plant
    has_secure_password

    validates :name, :email, presence: true

    def self.find_or_create_with_oauth(auth)
        user = User.find_or_create_by_email(auth)
        user.email = auth["info"]["email"]
        # user.uid = auth["uid"]
        #  binding.pry
        user.save
        user
      end

    def self.find_or_create_by_email(auth)
        User.find_or_create_by(email: auth["info"]["email"]) do |user|
        #   user.uid = auth["uid"]
        user.password = SecureRandom.hex(20)
        user.name = auth["info"]["name"]
        user.save
        user
        end
      end
    
    

end


