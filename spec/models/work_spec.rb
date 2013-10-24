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
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:task) }
  it { should respond_to(:students) }

  it { should belong_to(:task) }
  it { should have_and_belong_to_many(:students) }

  it "should connect a student and a task" do
    student = Student.create
    task = Task.create
    work = Work.create
    work.task = task
    work.save
    student.works << work
    student.save
#    tasks = student.tasks.all
    expect(student.tasks).to include(task)
    expect(task.students).to include(student)
  end
end
