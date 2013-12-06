# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)
#

require 'spec_helper'

describe Work do
  let(:work) { FactoryGirl.create(:work) }

  subject { work }

  it { should respond_to(:task_id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:task) }
  it { should respond_to(:students) }
  it { should belong_to(:task) }
  it { should have_and_belong_to_many(:students) }

  it "should connect a student and a task" do
    student = FactoryGirl.create(:student)
    task = FactoryGirl.create(:task)
    work = FactoryGirl.create(:work)
    work.task = task
    work.save
    student.works << work
    student.save
    expect(student.tasks).to include(task)
    expect(task.students).to include(student)
  end

  it "should deliver the notification emails" do
    
    student1 = FactoryGirl.create(:student)
    student2 = FactoryGirl.create(:student)
    task = FactoryGirl.create(:task)
    work = Work.new
    
    mail = double
    expect(mail).to receive(:deliver).twice
    WorkMailer.should_receive(:new_work).with(work, student1).and_return(mail)
    WorkMailer.should_receive(:new_work).with(work, student2).and_return(mail)

    work.task = task
    work.students << student1 << student2
    work.save
  end

  describe "states" do
    let(:work) { FactoryGirl.create(:work) }

    it { should respond_to(:finish) }
    it { should respond_to(:finished?) }
    it { should respond_to(:in_progress?) }

    it "should be in_progress initially" do
      expect(work.in_progress?).to be true
    end

    it "should be finished after finish event" do
      work.finish
      expect(work.finished?).to be true
    end
  end
end
