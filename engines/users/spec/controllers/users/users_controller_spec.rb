require File.expand_path('engines/users/spec/spec_helper')

RSpec.describe Users::UsersController, type: :controller do
  routes { Users::Engine.routes }

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET show' do
    it 'decorates and assigns the requested user to @user' do
      get :show, id: user
      expect(assigns(:user).object).to eq user
    end
  end
end
