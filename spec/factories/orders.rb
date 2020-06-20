# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    sequence(:description) { |t| "Pedido numero - #{t}" }
    customer
  end
end
