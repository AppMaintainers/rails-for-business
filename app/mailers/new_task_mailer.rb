class NewTaskMailer < ActionMailer::Base
  default :from => "r4b@example.com"

  def new_task(task)
    @task = task
    @url = "http://r4b.appmaintainers.com/"
    mail(:to => "rails-for-business-2013-autumn@appmaintainers.com", subject: '[Rails for Business] New task posted!')
   end
end
