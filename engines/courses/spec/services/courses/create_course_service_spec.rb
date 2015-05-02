require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::CreateCourseService, type: :service do
  let(:create_course_service) { described_class }
  let(:mentor) { create(:mentor) }
  let(:course_params) { { title: 'MMA', description: 'Punch stuff', category_ids: [1, 2, 3] } }

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

    it 'sets ownership' do
      create_course_service.call(mentor, course_params)
      course = Courses::Course.last

      expect(course.owner).to eq mentor
    end

    it 'assigns categories' do
      fitness = create(:category, name: 'Fitness')
      fighting = create(:category, name: 'Fighting')
      martial_arts = create(:category, name: 'Martial arts')

      create_course_service.call(mentor, course_params)
      expect(Courses::CourseCategory.all.each_entry.map(&:category_id)).to match_array [fitness.id, fighting.id, martial_arts.id]
    end
  end
end
