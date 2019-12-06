class UsersController < ApplicationController
    skip_before_action :authenticate_request

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new({
            firstname: params[:firstname],
            lastname: params[:lastname],
            username: params[:username],
            password: params[:password]
        })

        if @user.valid?
            @user.save
            render json: UserSerializer.new(@user)
        else
            render json: { error: @user.errors.full_messages }
        end
    end
end
