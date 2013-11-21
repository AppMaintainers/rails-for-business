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
    student = Student.create(name: "Example Student", email: "student@foobar.com", nickname: "Student", password: "12345678")
    task = Task.create
    work = Work.create
    work.task = task
    work.save
    student.works << work
    student.save
    expect(student.tasks).to include(task)
    expect(task.students).to include(student)
  end

  it "should send emails" do
    student1 = Student.create(name: "Example Student", email: "student1@foobar.com", nickname: "Student1", password: "12345678")
    student2 = Student.create(name: "Example Student", email: "student2@foobar.com", nickname: "Student2", password: "12345678")
    task = Task.create(description: "Task", points: 3)
    work = Work.new
    work.task = task
    work.students << student1 << student2
    work.save
    work.students.each_with_index do |student, index|
      expect(ActionMailer::Base.deliveries[index].to).to eq [student.email]
    end
  end
end
