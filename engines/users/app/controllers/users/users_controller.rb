module Users
  class UsersController < ApplicationController

    before_action :authenticate_user!, only: :dashboard

    def show
      @user = UserFacade.new(user, self)
    end

    def dashboard
      @user = UserFacade.new(current_user)
    end

    private

    def user
      User.find(params[:id])
    end
  end
end
