class Subject < ActiveRecord::Base
	has_many :user_subject
	has_many :course_subject
	has_many :task
end
