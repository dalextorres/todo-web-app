class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        if @user.save
            flash[:success] = "Success in creating your user"
            redirect_to root_path
        else
            render 'users/new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to root_url
            flash[:success] = "User updated"
        else
            render 'edit'
        end
    end

    private

        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end

end
