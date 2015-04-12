require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::EnrollmentsController, type: :controller do

  routes { Courses::Engine.routes }

  before(:each) do
    login_user
  end

  describe 'POST create' do
    before(:each) do
      @course = create(:course)
    end

    context 'with valid params' do
      it 'creates an enrollment record' do
        expect {
          post :create, id: @course.id
        }.to change(Courses::Enrollment, :count).by(1)
      end
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @course = create(:course)
      create(:enrollment, user_id: @user, course: @course)
    end

    context 'with valid params' do
      it 'deletes the enrollment record' do
        expect {
          delete :destroy, id: @course.id
        }.to change(Courses::Enrollment, :count).by(-1)
      end
    end
  end
end
