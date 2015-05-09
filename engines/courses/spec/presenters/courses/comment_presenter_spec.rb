require File.expand_path('engines/courses/spec/spec_helper')

RSpec.describe Courses::CommentPresenter, type: :presenter do

  let(:comment) { create(:comment, body: 'Great stuff') }
  let(:view_context) { Courses::CoursesController.new.view_context }
  let(:comment_presenter) { Courses::CommentPresenter.new(comment, view_context) }

  describe '#body' do
    context 'when the comment is active' do
      it 'displays the body' do
        comment.update!(state: 'active')

        expect(comment_presenter.body).to include 'Great stuff'
      end
    end

    context 'when the comment is not active' do
      it 'display a message instead' do
        comment.update!(state: 'archived')

        expect(comment_presenter.body).to eq '[Comment deleted]'
      end
    end
  end

  describe '#reply_button' do
    context 'when posted by the current_user' do
      it 'outputs nil' do
        allow(view_context).to receive(:current_user).and_return(comment.owner)
        expect(comment_presenter.reply_button).to eq nil
      end
    end

    context 'when posted by the current_user' do
      context 'when active' do
        it 'outputs the reply button' do
          allow(view_context).to receive(:current_user).and_return(double(Users::User))
          expect(comment_presenter.reply_button).to include 'Reply'
        end
      end

      context 'when not active' do
        it 'outputs nothing' do
          allow(view_context).to receive(:current_user).and_return(double(Users::User))

          comment.update!(state: 'archived')
          expect(comment_presenter.reply_button).to eq nil
        end
      end
    end
  end

  describe '#edit_button' do
    context 'when posted by the current_user' do
      it 'outputs the edit button' do
        allow(view_context).to receive(:current_user).and_return(comment.owner)
        expect(comment_presenter.edit_button).to include 'Edit'
      end
    end

    context 'when posted by the current_user' do
      context 'when active' do
        it 'outputs nil' do
          allow(view_context).to receive(:current_user).and_return(double(Users::User))
          expect(comment_presenter.edit_button).to eq nil
        end
      end

      context 'when not active' do
        it 'outputs nothing' do
          allow(view_context).to receive(:current_user).and_return(double(Users::User))

          comment.update!(state: 'archived')
          expect(comment_presenter.edit_button).to eq nil
        end
      end
    end
  end

  describe '#delete_button' do
    context 'when posted by the current_user' do
      it 'outputs delete button' do
        skip('Find efficient test strategy')
        # allow(view_context).to receive(:current_user).and_return(comment.owner)
        # comment_presenter.delete_button
      end
    end

    context 'when posted by the current_user' do
      context 'when active' do
        it 'outputs nil' do
          allow(view_context).to receive(:current_user).and_return(double(Users::User))
          expect(comment_presenter.delete_button).to eq nil
        end
      end

      context 'when not active' do
        it 'outputs nothing' do
          allow(view_context).to receive(:current_user).and_return(double(Users::User))

          comment.update!(state: 'archived')
          expect(comment_presenter.delete_button).to eq nil
        end
      end
    end
  end
end
