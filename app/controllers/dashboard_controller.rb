class DashboardController < ApplicationController
  allow_unauthenticated_access only: [:index]

  def index
    @users_posts = []

    User.all.each do |user|
      @users_posts.push(user.posts.all)
    end
  end
end
