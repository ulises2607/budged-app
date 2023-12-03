require 'rails_helper'

RSpec.describe GroupPaymentsController, type: :request do
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }
  let(:group_payment) { create(:group_payment, group:) }
  let(:valid_attributes) { attributes_for(:group_payment) }
  let(:invalid_attributes) { attributes_for(:group_payment, name: nil) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get group_group_payments_path(group)
      expect(response).to have_http_status(:success)
    end

    it 'assigns @group, @payments, and @total' do
      get group_group_payments_path(group)
      expect(assigns(:group)).to eq(group)
      expect(assigns(:payments)).to be_an(Array)
      expect(assigns(:total)).to be_a(Numeric)
    end

    it 'renders the index template' do
      get group_group_payments_path(group)
      expect(response).to render_template(:index)
    end
  end
end
