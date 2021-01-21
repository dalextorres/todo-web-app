class StaticPagesController < ApplicationController
  def home
    if logged_in?
      puts current_user
      puts current_user.inspect
      @task = current_user.tasks.build
      @feed_items = current_user.feed
    end
  end
end
