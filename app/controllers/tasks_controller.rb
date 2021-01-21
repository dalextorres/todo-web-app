class TasksController < ApplicationController

    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: [:destroy]

    def create
        @task = current_user.tasks.build(tasks_params)
        if @task.save
            flash[:success] = "Task created!"
            redirect_to root_url
        else    
            @feed_items = current_user.feed
            redirect_to root_url
        end
    end

    def destroy
        @task.destroy
        flash[:success] = "Task deleted"
        redirect_to root_url
    end

    private

        def tasks_params
            params.require(:task).permit(:title, :content)
        end

        def correct_user
            @task = current_user.tasks.find_by(params[:id])
            redirect_to root_url if @task.nil?
        end

end
