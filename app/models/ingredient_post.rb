class IngredientPost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :body, length: {maximum: 100}, presence: true
end
