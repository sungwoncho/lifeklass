require File.expand_path('engines/mentors/spec/spec_helper')

RSpec.describe Mentors::MentorPresenter, type: :presenter do
  let(:mentor_presenter) { Mentors::MentorPresenter.new(mentor) }

  describe '#firstname' do
    let(:user) { instance_double(Users::User, name: 'Marco Polo') }
    let(:mentor) { Mentors::Mentor.new }

    it 'returns the firstname' do
      allow(mentor).to receive(:user).and_return(user)

      expect(mentor_presenter.firstname).to eq "Marco"
    end
  end

  describe '#lastname' do
    let(:user) { instance_double(Users::User, name: 'Marco Polo') }
    let(:mentor) { Mentors::Mentor.new }

    it 'returns the lastname' do
      allow(mentor).to receive(:user).and_return(user)

      expect(mentor_presenter.lastname).to eq "Polo"
    end
  end
end
