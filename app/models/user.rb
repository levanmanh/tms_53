class User < ActiveRecord::Base
	has_many :user_courses
	has_many :user_subject
	has_many :user_task
	has_many :activities
end
