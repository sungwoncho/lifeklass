module Users
  class UsersController < ApplicationController
    before_action :set_user, only: :show

    def show
    end

    private

    def set_user
      @user = UserPresenter.new(user)
    end

    def user
      User.find(params[:id])
    end
  end
end
