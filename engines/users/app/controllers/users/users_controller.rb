module Users
  class UsersController < ApplicationController

    def show
      @user = UserFacade.new(user, self)
    end

    private

    def user
      User.find(params[:id])
    end
  end
end
