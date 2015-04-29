require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::CreateCourseService, type: :service do
  let(:create_course_service) { described_class }
  let(:mentor) { create(:mentor) }
  let(:course_params) { { title: 'MMA', description: 'Punch stuff' } }

  describe '.call' do
    it 'creates a course' do
      expect {
        create_course_service.call(mentor, course_params)
      }.to change(Courses::Course, :count).by(1)
    end

    it 'creates a mentorship' do
      expect {
        create_course_service.call(mentor, course_params)
      }.to change(Mentors::Mentorship, :count).by(1)
    end

    it 'sets correct attributes for the mentorship' do
      create_course_service.call(mentor, course_params)

      mentorship = Mentors::Mentorship.last
      course = Courses::Course.last
      expect(mentorship.mentor_id).to eq mentor.id
      expect(mentorship.course_id).to eq course.id
    end

    it 'returns the created course' do
      result = create_course_service.call(mentor, course_params)

      expect(result).to eq Courses::Course.last
    end
  end
end
