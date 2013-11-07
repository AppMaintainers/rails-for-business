# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :string(255)
#  points      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  business    :boolean          default(FALSE), not null
#  one_time    :boolean
#  parent_id   :integer
#

class Task < ActiveRecord::Base
  has_many :works
  has_many :students, through: :works
  belongs_to :parent, class_name: "Task"
  has_many :children, class_name: "Task", foreign_key: "parent_id"

  default_scope { order('tasks.created_at DESC') }

  def available?
    if self.business
      students.empty?
    else
      true
    end
  end
end
