require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::ContentsController, type: :controller do

  routes { Courses::Engine.routes }

  before(:each) do
    login_mentor
    allow(controller).to receive(:authorize_instructor!).and_return(true)
  end

  describe 'POST create' do
    it 'creates a new content' do
      menu = create(:menu)
      course = menu.course

      expect {
        post :create, course_id: course.id, menu_id: menu.id, content: attributes_for(:content)
      }.to change(Courses::Content, :count).by(1)
    end
  end

  describe 'PUT update' do
    it 'updates the content' do
      menu = create(:menu)
      course = menu.course
      content = create(:content, title: 'Week 1 Lecture 1', course: course, menu: menu)

      put :update, course_id: course.id, menu_id: menu.id, id: content.id, content: attributes_for(:content, title: 'Week 1 - Introduction')
      content.reload
      expect(content.title).to eq 'Week 1 - Introduction'
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the content' do
      menu = create(:menu)
      course = menu.course
      content = create(:content)

      expect {
        delete :destroy, course_id: course.id, menu_id: menu.id, id: content.id
      }.to change(Courses::Content, :count).by(-1)
    end
  end
end
