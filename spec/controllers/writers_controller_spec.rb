require 'rails_helper'

RSpec.describe WritersController, type: :controller do
  describe "GET #index" do
    it "assigns @writers" do
      all_writers = Writer.all
      get :index
      expect(assigns(:writers)).to eq(all_writers)
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe "POST #create" do 
    it "adds new writer and redirect to root_path" do
      writers_count = Writer.count
      params = { writer: {name: 'test1', email: 'test1@gmail.com', password: '12345678',
                                               password_confirmation: '12345678'} }
      post :create, params: params
      expect( Writer.count).to eq(writers_count + 1)
      expect(response).to redirect_to(root_path)
    end
  end
end
