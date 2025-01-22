# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.date = Time.current
    
    if @post.save
      redirect_to posts_path, notice: 'Post created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end