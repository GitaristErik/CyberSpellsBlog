class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    post_find
  end

  def edit
    post_find
 end

 def create
   @post = Post.create(post_params)
   @post.username = current_user.email
   if(@post.save)
     redirect_to @post
   else render 'new'
   end
 end

  def update
    if(post_find.update(post_params))
      redirect_to post_find
    else render 'edit'
    end
  end

  def destroy
    post_find.destroy
    redirect_to posts_path
  end

  private

  def post_find
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :username, images: [])
  end
end
