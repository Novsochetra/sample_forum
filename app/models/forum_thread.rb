# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  subject    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ForumThread < ApplicationRecord
	belongs_to :user
	
	has_many :forum_posts
	has_many :users, through: :forum_posts
	
	accepts_nested_attributes_for :forum_posts

	validates :subject, presence: true

	# we also validate to association
	validates_associated :forum_posts
end
