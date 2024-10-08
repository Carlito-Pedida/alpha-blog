class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           flash[:notice] = "Your account was updated successfully"
           redirect_to root_path
        else
            render "new"
        end
    end


    def create
        @user = User.new(user_params)
        if @user.save
           flash[:notice] = "Welcome to the Alpha Blog, your account was created successfully"
           redirect_to root_path
        else
            render "new"
        end
    end
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end
end
