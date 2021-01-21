class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash.now[:success] = "Successful login"
            render 'static_pages/home'
        else
            flash.now[:warning] = "Email or password is incorrect"
            render 'sessions/new'
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to root_url
        flash[:success] = "Logged out"
    end
end
