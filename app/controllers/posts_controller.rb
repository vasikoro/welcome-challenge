class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @post = Post.find(params[:id])
  end

	def index
    # TODO: Paginate
    @posts = Post.all
	end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)

    if @post.errors.any?
      flash[:alert] = @post.errors.full_messages.to_sentence
      redirect_path(fallback_location: posts_path)
    else
      flash[:notice] = "Successfully updated post with title '#{@post.title}'"
      redirect_to post_path(@post.id)
    end
  end

  def create
    post = Post.create(post_params.merge(user: current_user))

    if post.errors.any?
      flash[:alert] = post.errors.full_messages.to_sentence
    else
      flash[:notice] = "Successfully created post with title '#{post.title}'"
      redirect_to posts_path
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Destroyed post with id #{params[:id]}"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
