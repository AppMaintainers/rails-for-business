namespace :db do
  desc "Mark business tasks already in the database as one_time"
  task set_one_time: :environment do
    Task.where(business: true).update_all one_time: true
  end
end
