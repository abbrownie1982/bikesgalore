require 'rails_helper'

describe UsersController, :type => :controller do
    before do
      #@user = User.create!(email: "anne2@anne.com", password: "biker2")
      #@user2 = User.create!(email: "anne3@anne.com", password: "biker3")
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
    end
  describe 'get #show' do
    context 'User is logged in' do
      before do
        sign_in @user
      end
      it 'loads correct user details' do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
      it "can't access show page of the 2. user" do
        get :show, id: @user2.id
        expect(response).to redirect_to(root_path)
      end
    end
    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, id: @user.id
        expect(response).to redirect_to(root_path)
      end
    end
  end
end