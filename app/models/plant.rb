class Plant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  
  validates :name, uniqueness: true, presence: true

  scope :alpha, -> { order(:descending) }

end
