class WorkMailer < ActionMailer::Base
  default from: "r4b@appmaintainers.com"

  def new_work(work, student)
    @work = work
    @student = student
    mail(to: student.email, subject: '[Rails for Business] Work registered')
  end
end
