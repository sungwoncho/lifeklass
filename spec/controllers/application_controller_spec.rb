require "rails_helper"

RSpec.describe ApplicationController do
  let(:application_controller) { ApplicationController.new }

  describe '#current_mentor' do
    context 'when current_user is nil' do
      it 'returns nil' do
        allow(application_controller).to receive(:current_user).and_return(nil)
        expect(application_controller.current_mentor).to eq nil
      end
    end

    context 'when current_user is present' do
      it 'returns the current mentor object' do
        user = create(:user)
        mentor = create(:mentor, user: user)
        allow(application_controller).to receive(:current_user).and_return(user)

        expect(application_controller.current_mentor).to eq mentor
      end
    end
  end

  describe '#authenticate_mentor!' do
    context 'when there is current_mentor' do
      it 'returns true' do
        allow(application_controller).to receive(:current_mentor).and_return(double(Mentors::Mentor))
        expect(application_controller.authenticate_mentor!).to eq true
      end
    end

    context 'when there is no current_mentor' do
      it 'returns false' do
        allow(application_controller).to receive(:current_mentor).and_return(nil)
        expect(application_controller.authenticate_mentor!).to eq false
      end
    end
  end
end
