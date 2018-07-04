class ForumThreadsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_forum_thread, except: [:index, :new, :create]

	def index
		@forum_threads = ForumThread.all
	end

	def new
		@forum_thread = ForumThread.new
		@forum_thread.forum_posts.new
	end

	def create
		# assgined user_id to forum_thread
		@forum_thread = current_user.forum_threads.new forum_thread_params

		# assigned user_id to forum_post
		# we only create the thread for a post so we can access it by { @forum_thread.forum_posts.first }
		@forum_thread.forum_posts.first.user_id = current_user.id

		if @forum_thread.save
			redirect_to @forum_thread
		else
			render :new
		end
	end
	
	def show
		
	end

	def destroy
		
	end

	private
		def set_forum_thread
			@forum_thread = ForumThread.find(params[:id])
		end

		def forum_thread_params
			params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
		end

end