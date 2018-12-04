class PostsController < ApplicationController

  def index
  	@posts = Post.all
  	@post =Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def top
  end

  def create
  	post = Post.new(post_params)
  	if post.save
       flash[:notice] = "successfully"
  	   redirect_to post_path(post.id)
    end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	if post.update(post_params)
  	   flash[:notice] = "successfully"
  	   redirect_to post_path(post.id)
  	end
  end

  def destroy
  	post = Post.find(params[:id])
  	if post.destroy
  	   flash[:notice] = "successfully"
  	   redirect_to posts_path
    end
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
