class UsersController < ApplicationController
    def create
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :phone, :password)
    end
end
