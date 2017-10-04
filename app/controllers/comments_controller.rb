class CommentsController < ApplicationController
	load_and_authorize_resource
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(content:params[:comment][:content], user: current_user)
		@post.comments << @comment
		@comment.save
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@post.comments.delete(@comment)
		redirect_to post_path(@post)
	end
	private
	  def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
