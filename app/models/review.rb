class Review < ApplicationRecord
    belongs_to :user
    belongs_to :plant

    scope :last_3, -> { order(created_at: :desc).limit(3)}

end
