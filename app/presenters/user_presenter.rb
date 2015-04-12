class UserPresenter < ApplicationPresenter

  def firstname
    name_components.first.humanize
  end

  def lastname
    name_components.last.humanize
  end

  private

  def name_components
    model.name.split(/\s+/)
  end
end
