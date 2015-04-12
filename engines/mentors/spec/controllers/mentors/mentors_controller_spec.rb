require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::MentorsController, type: :controller do
  routes { Mentors::Engine.routes }

  context 'as a user' do
    before(:each) do
      login_user
    end

    describe 'GET show' do
      before(:each) do
        @mentor = create(:mentor)
      end
      it 'decorates and assigns the reqeusted mentor as @mentor' do
        get :show, id: @mentor
        expect(assigns(:mentor).object).to eq @mentor
      end
    end
  end
end
