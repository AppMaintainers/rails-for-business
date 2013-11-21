# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Work < ActiveRecord::Base
  has_and_belongs_to_many :students
  belongs_to :task

  after_create :send_user_notification

  def send_user_notification
    self.students.each do |student|
      WorkMailer.new_work(self, student).deliver
    end
  end
end
