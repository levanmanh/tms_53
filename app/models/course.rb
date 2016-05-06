class Course < ActiveRecord::Base
	has_many :user_courses
	has_many :course_subject
end
