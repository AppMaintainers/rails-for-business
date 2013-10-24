# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  nickname   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Student do
  
  before do
    @student = Student.new(name: "Example Student", email: "student@foobar.com", nickname: "Student")
  end

  subject {@student }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:nickname) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:tasks) }
  it { should respond_to(:works) }

  it { should have_and_belong_to_many(:works) }
  it { should have_many(:tasks).through(:works) }

  it "should be saved to database" do
    @student.save
    loaded = Student.first
    expect(loaded).to eq(@student)
  end

end

