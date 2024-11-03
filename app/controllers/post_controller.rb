class PostController < ApplicationController
  allow_unauthenticated_access only: [:show]

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new(params[:post])
  end

  def create
    @user = Current.user
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
