class CommentsController < ApplicationController
  allow_unauthenticated_access

  def create

    if authenticated?
      @user = User.find_by_username(Current.user.username)
    end
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.build(content: params[:content], user: @user)
    @comment = @post.comments.build(comment_params)
    @comment.user = @user

    if @comment.save
      redirect_to @post
    else
      render "post/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
