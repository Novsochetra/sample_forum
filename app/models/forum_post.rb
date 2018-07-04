# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  forum_thread_id :integer
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ForumPost < ApplicationRecord
	belongs_to :user
	belongs_to :forum_thread

	def send_notification!
		users = forum_thread.users.uniq - [user]
		users.each do |user|
			NotificationMailer.forum_post_notification(user, self).deliver_later
		end
	end
end
