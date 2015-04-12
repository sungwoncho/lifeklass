require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
