require "spec_helper"

describe WorkMailer do
  describe 'email' do
    before(:all) do
      @student = Student.create(name: "Example Student", email: "student@foobar.com", nickname: "Student", password: "12345678")
      @task = Task.create(description: "Task", points: 3)
      work = Work.new
      work.task = @task
      work.students << @student
      work.save
      @mail = ActionMailer::Base.deliveries.last
    end
  
    it "should render the subject" do
      expect(@mail.subject).to eq "[Rails for Business] Work registered"
    end

    it "should render the correct receiver mail" do
      expect(@mail.to).to eq [@student.email]
    end
    
     it " should render the correct sender email" do
      expect(@mail.from).to eq ["r4b@appmaintainers.com"]
    end

    it "should render task information" do
      expect(@mail.body.encoded).to have_content @task.description
      expect(@mail.body.encoded).to have_content@task.points
    end

    it "should render student information" do
      expect(@mail.body.encoded).to have_selector("th", text: "Name")
      expect(@mail.body.encoded).to have_selector("th", text: "Points")
      expect(@mail.body.encoded).to have_selector("td", text: @student.name)
      expect(@mail.body.encoded).to have_selector("td", text: @student.sum_points)
    end
  end
end
