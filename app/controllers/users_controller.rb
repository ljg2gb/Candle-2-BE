class UsersController < ApplicationController
    def create
        @user = User.new(user_params)

            if @user.save
                token = create_token(@user)
                render json: {
                    message: "Success user #{@user.name} has been created.",
                    token: token
                }
            else
                render json: { message: @user.errors.messages }
            end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :phone, :password)
    end
end
