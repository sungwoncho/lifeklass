require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::SearchService, type: :service do
  let(:search_service) { Courses::SearchService.new(params) }


  describe '#call' do
    context 'with params[:title]' do
      let(:params) { {title: 'startup'} }

      it 'finds course with similar name' do
        guitar_lesson = create(:course, title: "Guitar lesson")
        startup_class = create(:course, title: "Startup Class")
        result = search_service.call

        expect(result).to match_array [startup_class]
      end
    end
  end
end
