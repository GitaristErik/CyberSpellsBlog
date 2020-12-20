class CommentsController < ApplicationController

  def create
    @comment = post_find.comments.create(comment_params)
    redirect_to post_path(post_find)
  end

  private

  def post_find
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
