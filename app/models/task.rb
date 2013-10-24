# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :string(255)
#  points      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
  has_many :works
  has_many :students, through: :works

  default_scope { order('tasks.created_at DESC') }
end
