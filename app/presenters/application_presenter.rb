class ApplicationPresenter

  attr_reader :object

  def initialize(object)
    @object = object
  end

  def model
    @object
  end

  private

  def method_missing(method, *args)
    args.empty? ? @object.send(method) : @object.send(method, *args)
  end
end
