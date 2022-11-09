class Food < ApplicationRecord
  belongs_to :user, class_name: 'User'

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :quantity, numericality: {greater_than_or_equal_to: 0}

end
