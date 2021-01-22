class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @task = current_user.tasks.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
    end
  end
end
