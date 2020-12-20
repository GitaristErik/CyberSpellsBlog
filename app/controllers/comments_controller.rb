class CommentsController < ApplicationController

  def create
    @comment = post_find.comments.create(comment_params)
    @comment.username = current_user.email
    if(@comment.save)
      redirect_to post_path(post_find)
    end
  end

  def destroy
    if(comment_find.destroy)
      redirect_to post_path(post_find)
    end
  end

  private

  def post_find
    @post = Post.find(params[:post_id])
  end

  def comment_find
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
