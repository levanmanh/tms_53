class Task < ActiveRecord::Base
  belongs_to :subject

  has_many :user_task
end
