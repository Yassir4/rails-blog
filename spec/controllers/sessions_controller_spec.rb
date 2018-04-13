require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    
    before{@writer = Writer.create(name: 'test', email: 'test1@gmail.com', password: '12345678') }
    
    # before(:all) do
    #     @writer = create(:writer)
    # end

    describe "GET #new" do
        it "renders the :new view" do 
            get :new
            expect(response).to render_template(:new)
        end
    end
    describe "POST #create" do 
        context "Success" do 
            it "log in and update the user remember_token" do 
                params = { session: { email: 'test1@gmail.com', password: '12345678', remember_me: '1'} }
                post :create, params: params
                expect(response).to redirect_to(@writer)
                expect(@writer.reload.remember_token).to_not be_nil
            end
            
        end
        context "Failure" do 
            it "redirect to login form if create fails" do 
                params = { session: { email: 'false@gmail.com', password: '1234'} }
                post :create, params: params
                expect(response).to render_template(:new)
            end
        end
    end
end
