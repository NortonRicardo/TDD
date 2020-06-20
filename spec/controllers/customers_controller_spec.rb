# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  context 'permition acess' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
    it 'returns a not acess 200 response' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).not_to have_http_status '200'
    end
  end

  context 'As logged member' do
    it 'returns a 301 response (not permison)' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status '302'
    end
    it 'login member and acess show customer' do
      member = create(:member)
      customer = create(:customer)
      sign_in member
      get :show, params: { id: customer.id }
      expect(response).to have_http_status '200'
    end
  end
end
