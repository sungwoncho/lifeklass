require "rails_helper"

describe Users::UserPresenter, type: :presenter do
  let(:user_presenter) { Users::UserPresenter.new(user, view_context) }
  let(:view_context) { nil }

  describe '#firstname' do
    let(:user) { instance_double(Users::User, name: 'Marco Polo') }

    it 'returns the firstname' do
      expect(user_presenter.firstname).to eq "Marco"
    end
  end

  describe '#lastname' do
    let(:user) { instance_double(Users::User, name: 'Marco Polo') }

    it 'returns the lastname' do
      expect(user_presenter.lastname).to eq "Polo"
    end
  end

  describe '#user_page_heading' do
    let(:view_context) { double(Class) }

    context 'when user is the current user' do
      let(:user) { double(Users::User, id: 1, name: 'Marco Polo') }

      it "outputs 'dashboard'" do
        allow(view_context).to receive(:current_user).and_return(user)

        expect(user_presenter.user_page_heading).to eq 'Dashboard'
      end
    end

    context 'when user is not the current user' do
      let(:user) { double(Users::User, id: 1, name: 'Marco Polo') }
      let(:current_user) { double(Users::User, id: 2, name: 'Christopher Colombus') }

      it "outputs appropriate heading" do
        allow(view_context).to receive(:current_user).and_return(current_user)

        expect(user_presenter.user_page_heading).to match %(profile)
      end
    end
  end
end
