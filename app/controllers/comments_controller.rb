class CommentsController < ApplicationController
	
	 before_filter :load_commentable,:except=>[:new]

	# def index
	# 	@comments =comments.recent.limit(10).all
	# end
 def new
 	@comment = Comment.new
 end
	def create
		@comment = @commentable.comments.build(params[:comment])
		@comment.user_id = current_user.id
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @commentable }
				flash[:info] = "Your review is added "
			else
				format.html { render :action => 'new' }
			end
		end
	end

	protected

	def load_commentable
		debugger
		@commentable = params[:commentable_type].camelize.constantize.find(params[:commentable_id])
		@comments = @commentable.comments.recent.limit(10).all
	end
end