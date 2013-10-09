# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  student_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Work < ActiveRecord::Base
  belongs_to :student
  belongs_to :task
end
