class CommentController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)

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
