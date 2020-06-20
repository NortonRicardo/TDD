# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Customer sub name' do
    customer = create(:customer, name: 'Norton')
    expect(customer.full_name).to eq('Sr. Norton')
  end

  it 'Customer Teste vip' do
    customer = create(:customer_vip)
    expect(customer.vip).not_to be_falsey
  end

  it 'Customer full name' do
    customer = create(:user)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'Usando attributes For' do
    attrs = attributes_for(:customer)
    puts attrs
  end

  it 'create customer email dowcase' do
    customer = create(:customer_vip, email: 'NORTON@NORTON.COM')
    expect(customer.email).to eq(customer.email.downcase)
  end

  it 'Atributo Transitorio' do
    customer = create(:customer_vip, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end
end
