# == Schema Information
#
# Table name: students
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)      default(""), not null
#  nickname               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
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

