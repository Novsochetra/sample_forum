class NotificationMailer < ApplicationMailer
	default from: 'sochetra12.nov@gmail.com'
	
	def forum_post_notification(user, forum_post)
		@user = user
		@forum_post = forum_post

		mail(
			to: user.email,
			subject: "#{forum_post.forum_thread.subject}"
			)
	end
end
