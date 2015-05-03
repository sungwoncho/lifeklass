require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::ContentPresenter, type: :presenter do
  let(:content) { create(:content) }
  let(:view_context) { Courses::CoursesController.new.view_context }
  let(:content_presenter) { Courses::ContentPresenter.new(content, view_context) }

  describe '#posted_on' do
    it 'formats the time' do
      allow(content).to receive(:created_at).and_return(Date.new(2015,5,3))
      expect(content_presenter.posted_on).to eq "05/03/2015"
    end
  end
end
