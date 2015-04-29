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
end
