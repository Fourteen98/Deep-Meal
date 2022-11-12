class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 18 }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { maximum: 450 }
end
