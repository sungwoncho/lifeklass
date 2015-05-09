require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::Comment, type: :model do
  describe 'association' do
    it { should belong_to(:owner) }
    it { should belong_to(:content) }
  end

  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end

  describe '#posted_by?' do
    context 'when the owner of the comment is the argument' do
      it 'returns true' do
        comment = create(:comment)
        poster = comment.owner

        expect(comment.posted_by?(poster)).to eq true
      end
    end

    context 'when the owner of the comment is not the argument' do
      it 'returns false' do
        comment = create(:comment)
        another_user = instance_double(Users::User)

        expect(comment.posted_by?(another_user)).to eq false
      end
    end
  end
end
