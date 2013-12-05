namespace :db do
  desc "Mark works already in the database as finished"
  task set_finished: :environment do
    Work.update_all state: :finished
  end
end
