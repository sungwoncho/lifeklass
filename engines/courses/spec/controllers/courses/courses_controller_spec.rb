require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::CoursesController, type: :controller do

  routes { Courses::Engine.routes }

  before(:each) do
    login_user
  end

  describe "GET #show" do
    it "assigns the requested course as @course" do
      course = create(:course)
      get :show, id: course
      expect(assigns(:course)).to eq(course)
    end
  end

  describe 'POST create' do
    before(:each) do
      login_mentor
    end

    it 'calls the service' do
      course = create(:course)
      expect(Courses::CreateCourseService).to receive(:call).and_return(course)

      post :create, course: attributes_for(:course)
    end
  end
end
