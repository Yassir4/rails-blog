require 'rails_helper'

RSpec.describe WritersController, type: :controller do

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the writer' do
        post :create, writer: FactoryGirl.attributes_for(:post, writer: @writer)
      expect(response).to have_http_status(:success)
      end
    end
  end



end
