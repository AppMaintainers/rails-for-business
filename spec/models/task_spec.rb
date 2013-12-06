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

require 'spec_helper'

describe Task do
  
  let(:task) {FactoryGirl.create(:task)}

  subject { task }

  it { should respond_to(:description) }
  it { should respond_to(:points) }
  it { should respond_to(:business) }
  it { should respond_to(:one_time) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:students) }
  it { should respond_to(:works) }
  it { should respond_to(:parent) }
  it { should respond_to(:children) }

  it { should have_many(:works) }
  it { should have_many(:students).through(:works) }
  it { should have_many(:children) }
  it { should belong_to(:parent) }

  it "should be saved to database" do
    task.save
    loaded = Task.first
    expect(loaded).to eq(task)
  end

  describe "in parent-child relationship" do
    let(:parent) { FactoryGirl.create(:task) }
    let(:child) { FactoryGirl.create(:task) }

    it "should have a child" do
      child.parent = parent
      child.save
      
      expect(parent.children).to include(child)
    end

    it "should have parent" do
      parent.children << child
      parent.save
      
      expect(child.parent).to eq(parent)
    end
  end
end

