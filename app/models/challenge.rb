class Challenge < ApplicationRecord
  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges
  validates :name, :description, :length, :category, presence: true
  validates :name, uniqueness: true
  validates :length, inclusion: { in: [6, 14, 32] }
  validates :category, inclusion: { in: ["Crafting","Creative Writing","Creative Lesson"] }
  has_one_attached :video
end
