class AddBusinessToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :business, :boolean 
  end
end
