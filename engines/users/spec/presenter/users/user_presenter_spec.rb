require "rails_helper"

describe UserPresenter, type: :presenter do
  let(:user_presenter) { UserPresenter.new(user) }

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
