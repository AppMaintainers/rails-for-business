require "spec_helper"

describe WorkMailer do
  describe 'email' do
    before(:all) do
      @student = FactoryGirl.create(:student)
      @task = FactoryGirl.create(:task)
      @work = FactoryGirl.create(:work)
      @work.task = @task
      @work.students << @student
      @mail = WorkMailer.new_work(@work, @student)
    end

    it "should have the correct subject" do
      expect(@mail).to have_subject("[Rails for Business] Work registered")
    end

    it "should be set to be delivered to the email passed in" do
      expect(@mail).to deliver_to(@student.email)
    end

     it " should render the correct sender email" do
      expect(@mail).to deliver_from("r4b@appmaintainers.com")
    end

    it "should contain task information" do
      expect(@mail).to have_body_text /#{@task.description}/
      expect(@mail).to have_body_text /#{@task.points}/
    end

    it "should contain student information" do
      expect(@mail.body.encoded).to have_selector("th", text: "Name")
      expect(@mail.body.encoded).to have_selector("th", text: "Points")
      expect(@mail.body.encoded).to have_selector("td", text: @student.name)
      expect(@mail.body.encoded).to have_selector("td", text: @student.sum_points)
    end
  end
end
