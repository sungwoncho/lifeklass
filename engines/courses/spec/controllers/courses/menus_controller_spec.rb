require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::MenusController, type: :controller do

  routes { Courses::Engine.routes }

  before(:each) do
    login_mentor
    allow(controller).to receive(:authorize_instructor!).and_return(true)
  end

  describe 'PUT update' do
    it 'updates menu' do
      menu = create(:menu, name: 'Week 1')
      course = menu.course

      put :update, course_id: course.id, id: menu.id, menu: attributes_for(:menu, name: 'Week 2')
      menu.reload
      expect(menu.name).to eq 'Week 2'
    end
  end
end
