class UserPresenter < ApplicationPresenter

  def firstname
    model.name.split(/\s+/).first.humanize
  end

  def lastname
    model.name.split(/\s+/).last.humanize
  end
end
