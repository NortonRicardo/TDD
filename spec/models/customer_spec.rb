# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Customer sub name' do
    customer = create(:customer, name: 'Norton')
    expect(customer.full_name).to eq('Sr. Norton')
  end

  it 'Customer Teste vip' do
    customer = create(:user)
    expect(customer.vip).not_to be_falsey
  end

  it 'Customer full name' do
    customer = create(:user)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
