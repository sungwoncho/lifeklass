class ApplicationPresenter
  include ActionView::Helpers::UrlHelper

  attr_reader :object
  alias_method :model, :object

  attr_reader :view
  alias_method :h, :view

  def initialize(object, view = nil)
    @object = object
    @view = view
  end
  
  private

  def method_missing(method, *args)
    args.empty? ? @object.send(method) : @object.send(method, *args)
  end
end
