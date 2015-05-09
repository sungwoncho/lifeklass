require File.expand_path('engines/users/spec/spec_helper')

RSpec.describe Users::User, type: :model do
  describe 'association' do
    it { should have_one(:mentor) }
    it { should have_many(:enrollments) }
    it { should have_many(:courses).through(:enrollments) }
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe '#is_a_mentor?' do
    context 'when user has a mentor record' do
      it 'returns true' do
        @user = create(:user, :as_mentor)
        expect(@user.is_a_mentor?).to eq true
      end
    end

    context 'when user does not have a mentor record' do
      it 'returns false' do
        @user = create(:user)
        expect(@user.is_a_mentor?).to eq false
      end
    end
  end

  describe '#enrolled_in?' do
    before(:each) do
      @user = create(:user)
      @course = create(:course)
    end

    context 'when an enrollment record exists' do
      it 'returns true' do
        create(:enrollment, user: @user, course: @course)
        expect(@user.enrolled_in?(@course.id)).to eq true
      end
    end

    context 'when no enrollment record exists' do
      it 'returns false' do
        expect(@user.enrolled_in?(@course)).to eq false
      end
    end
  end

  describe '#enrolled_since' do
    context 'when user is enrolled in the course' do
      it 'returns the created_at of enrollment' do
        user = Users::User.new
        wealth = Courses::Course.new
        enrollment = create(:enrollment, user: user, course: wealth)

        expect(user.enrolled_since(wealth)).to eq enrollment.created_at
      end
    end
  end

  describe '#mentoring_courses' do
    it 'is delegated to mentor' do
      user = Users::User.new
      mentor = Mentors::Mentor.new
      allow(user).to receive(:mentor).and_return(mentor)

      expect(mentor).to receive(:mentoring_courses)
      user.mentoring_courses
    end
  end

  describe '#is_mentor_of?' do
    it 'is delegated to mentor' do
      user = Users::User.new
      mentor = Mentors::Mentor.new
      allow(user).to receive(:mentor).and_return(mentor)

      expect(mentor).to receive(:is_mentor_of?)
      user.is_mentor_of?(double(Courses::Course))
    end
  end
end
