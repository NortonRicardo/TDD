require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  it 'is valid with description blank' do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include('Descrição está em branco!')
  end

  it 'is valid with category blank' do
    product = build(:product, category: nil)
    product.valid?
    puts product.errors[:category]
    expect(product.errors[:category]).to include('Categoria está em branco!')
  end
end
