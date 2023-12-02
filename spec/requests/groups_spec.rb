# spec/controllers/groups_controller_spec.rb
require 'rails_helper'

RSpec.describe GroupsController, type: :request do
  
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  let(:valid_attributes) { attributes_for(:group) }
  let(:invalid_attributes) { attributes_for(:group, name: nil) }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/groups/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/groups'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Group' do
        expect {
          post '/groups', params: { group: valid_attributes }
        }.to change(Group, :count).by(1)
      end

      it 'redirects to the created group' do
        post '/groups', params: { group: valid_attributes }
        expect(response).to redirect_to(groups_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Group' do
        expect {
          post '/groups', params: { group: invalid_attributes }
        }.to change(Group, :count).by(0)
      end

      it 'renders new template' do
        post '/groups', params: { group: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
