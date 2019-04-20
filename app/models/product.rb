class Product < ApplicationRecord
  # Указываю, что продукт принадлежит категории
  belongs_to :category
  # Указываю, чтонужно проверять
  # name на наличие и уникльность
  #
  # а цену на наличие и на больше 0
  validates :name , presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
end
