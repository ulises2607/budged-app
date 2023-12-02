# spec/requests/payments_spec.rb
require 'rails_helper'

RSpec.describe PaymentsController, type: :request do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  let(:payment) { create(:payment, user: user) }
  let(:valid_attributes) { attributes_for(:payment) }
  let(:invalid_attributes) { attributes_for(:payment, name: nil) }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_group_payment_path(group)
      expect(response).to have_http_status(:success)
    end
  end


  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Payment' do
        expect {
          post group_payments_path(group), params: { payment: valid_attributes }
        }.to change(Payment, :count).by(1)
      end

      it 'redirects to the created payment' do
        post group_payments_path(group), params: { payment: valid_attributes }
        expect(response).to redirect_to(group_group_payments_path(group))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Payment' do
        expect {
          post group_payments_path(group), params: { payment: invalid_attributes }
        }.to change(Payment, :count).by(0)
      end

      it 'renders new template' do
        post group_payments_path(group), params: { payment: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
