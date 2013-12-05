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
  after_create :send_user_notification

  default_scope { order('tasks.created_at DESC') }

  scope :available, -> {all - joins(:works).where(one_time: true, works: {state: [:in_progress, :finished]})}

  def available?
    if self.one_time
      works.select(state: [:in_progress, :finished]).empty?
    else
      true
    end
  end

  def send_user_notification
    NewTaskMailer.new_task(self).deliver
  end
end
