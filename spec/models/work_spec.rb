# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Work do
  before do
    @work = Work.new
  end

  subject { @work }

  it { should respond_to(:task_id) }
  it { should respond_to(:student_id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:task) }
  it { should respond_to(:student) }

  it { should belong_to(:task) }
  it { should belong_to(:student) }

  it "should created when a task added to a student" do
    student = Student.new
    task = Task.new
    student.tasks << task
    student.save

    work = Work.where(task_id: task.id, student_id: student.id)
    expect(work).to be_true # not nil
  end

  it "should created when a student added to a task" do
    student = Student.new
    task = Task.new
    task.students << student
    task.save

    work = Work.where(task_id: task.id, student_id: student.id)
    expect(work).to be_true # not nil
  end
end
