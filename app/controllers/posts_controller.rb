class PostsController < ApplicationController
	def index
    # TODO: Paginate
    @posts = Post.all
	end
end
