module Users
  class UserFacade

    attr_reader :user, :controller
    alias_method :c, :controller

    def initialize(user, controller = nil)
      @user       = user
      @controller = controller
    end

    private

    def method_missing(method, *args)
      args.empty? ? @user.send(method) : @user.send(method, *args)
    end
  end
end
