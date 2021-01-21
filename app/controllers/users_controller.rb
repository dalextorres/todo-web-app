class UsersController < ApplicationController

    before_action :logged_in_user, only: [:edit, :update]
    before_action :correct_user, only: [:edit]

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
        # @user = Defined in correct_user
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

        def correct_user
            @user = User.find(params[:id])
            if current_user?(@user)
                return true
            else
                flash[:warning] = "You cannot edit another user's information"
                redirect_to(edit_user_path(current_user))
            end
        end

        def logged_in_user
            unless logged_in?
                flash[:warning] = "Please log in"
                redirect_to login_path
            end
        end

end
