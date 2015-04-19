module Mentors
  class MentorOrganization < ActiveRecord::Base
    belongs_to :mentor
    belongs_to :organization

    scope :by_organization_id, -> (organization_id) {
      where(organization_id: organization_id)
    }

    def self.get_mentor_ids_by_organization_id(organization_id)
      by_organization_id(organization_id).pluck(:mentor_id)
    end

    def self.get_members_by_id(organization_id)
      by_organization_id(organization_id).map(&:mentor)
    end
  end
end
