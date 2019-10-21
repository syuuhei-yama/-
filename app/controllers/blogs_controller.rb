class BlogsController < ApplicationController
	def new
	 @blog = Blog.new
	end

	def index
	  @blogs = Blog.all
	  @blog = Blog.new
	end

	def create
		blog = Blog.new(blog_params)
		blog.user_id = current_user.id
	    if blog.save
	      redirect_back(fallback_location: blogs_path)
	    else
	      redirect_back(fallback_location: blogs_path)
		end
	end

	def show
	  @blog = Blog.find(params[:id])
	  @comments = @blog.comments
      @comment = Comment.new
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		 blog = Blog.find(params[:id])
		 blog.update(blog_params)
		 redirect_to  blogs_path(blog.id)
	 end

	 def destroy
	 	blog = Blog.find(params[:id])
        blog.destroy
        redirect_to blogs_path
	 end


	private

	def blog_params
	  params.require(:blog).permit(:title,:member,:access,:schedule,:review,:image,:content)
    end
end