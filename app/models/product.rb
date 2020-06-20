class Product < ApplicationRecord
  belongs_to :category

  validates :description, presence: { message: 'Descrição está em branco!' }
  validates :category, presence: { message: 'Categoria está em branco!' }
end
