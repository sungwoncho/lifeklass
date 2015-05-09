module Courses
  class Comment < ActiveRecord::Base
    include Workflow
    has_ancestry

    belongs_to :owner, polymorphic: true
    belongs_to :content

    def posted_by?(commentor)
      owner == commentor
    end

    workflow_column :state
    workflow do
      state :active do
        event :archive, transition_to: :archived
      end

      state :archived
    end
  end
end
