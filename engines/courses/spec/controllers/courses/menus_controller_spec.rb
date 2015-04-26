require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::MenusController, type: :controller do

  routes { Courses::Engine.routes }

  before(:each) do
    login_mentor
    allow(controller).to receive(:authorize_instructor!).and_return(true)
  end

  describe 'POST create' do
    it 'creates a menu' do
      course = create(:course)

      expect {
        post :create, course_id: course.id, menu: attributes_for(:menu)
      }.to change(Courses::Menu, :count).by(1)

    end
  end

  describe 'PUT update' do
    it 'updates the menu' do
      menu = create(:menu, name: 'Week 1')
      course = menu.course

      put :update, course_id: course.id, id: menu.id, menu: attributes_for(:menu, name: 'Week 2')
      menu.reload
      expect(menu.name).to eq 'Week 2'
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the menu' do
      menu = create(:menu, name: 'Week 1')
      course = menu.course

      expect {
        delete :destroy, course_id: course.id, id: menu.id
      }.to change(Courses::Menu, :count).by(-1)
    end
  end
end
