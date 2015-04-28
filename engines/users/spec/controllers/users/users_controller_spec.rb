require File.expand_path('engines/users/spec/spec_helper')

RSpec.describe Users::UsersController, type: :controller do
  routes { Users::Engine.routes }

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET show' do
    it 'assigns a user_facade to @user' do
      get :show, id: user
      expect(assigns(:user)).to be_a(Users::UserFacade)
      expect(assigns(:user).user).to eq user
    end
  end
end
