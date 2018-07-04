class ForumThreads::ForumPostsController < ApplicationController

	def create
		forum_post = ForumPost.new forum_post_params
		forum_post.user_id = current_user.id
		forum_post.forum_thread_id = params[:forum_thread_id]
		forum_post.save

		# sending email to user when has someone post comment
		forum_post.send_notification!
		redirect_to forum_thread_path(params[:forum_thread_id])
	end

	private
		def forum_post_params
			params.require(:forum_post).permit(:body)
		end
end