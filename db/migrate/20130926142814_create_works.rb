class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :task_id
      t.integer :student_id
      t.timestamps
    end
  end
end
