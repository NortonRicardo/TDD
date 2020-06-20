# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do
      upcased false
      downcased true
      qtt_orders 3
    end

    name Faker::Name.name
    email Faker::Internet.email

    factory :customer_vip do
      vip true
      days_to_pay 30
    end

    factory :customer_default do
      vip false
      days_to_pay 10
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end

    after(:create) do |customer, evaluator|
      customer.email.downcase! if evaluator.downcased
    end
  end
end
