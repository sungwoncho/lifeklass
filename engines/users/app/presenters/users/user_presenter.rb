module Users
  class UserPresenter < ApplicationPresenter

    def firstname
      name_components.first.humanize
    end

    def lastname
      name_components.last.humanize
    end

    def mentor_badge
      if model.is_a_mentor?
        h.content_tag :div, class: 'label label-success' do
          "Mentor"
        end
      end
    end

    private

    def name_components
      model.name.split(/\s+/)
    end

    def enrolled_courses
      Courses::Course.by_user_id(self.id)
    end
  end
end
