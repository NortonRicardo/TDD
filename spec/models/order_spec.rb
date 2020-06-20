# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem 1 Pedido' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 Pedido' do
    orders = create_list(:order, 3)
    puts orders.inspect
    expect(orders.size).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)
    expect(customer.orders.size).to eq(3)
  end
end
