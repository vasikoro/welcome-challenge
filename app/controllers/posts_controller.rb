class PostsController < ApplicationController
	def index
    # TODO: Paginate
    @posts = Post.all
	end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if post.errors.any?
      flash[:alert] = post.errors.full_messages.to_sentence
    else
      flash[:notice] = "Successfully created post with title '#{post.title}'"
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
