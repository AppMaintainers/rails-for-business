class AddOneTimeFieldToTasks < ActiveRecord::Migration
  def change
      add_column :tasks, :one_time, :boolean
      add_index  :tasks, :one_time
   end
end
