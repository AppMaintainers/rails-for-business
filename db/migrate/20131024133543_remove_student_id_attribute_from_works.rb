class RemoveStudentIdAttributeFromWorks < ActiveRecord::Migration
  def change
    remove_column :works, :student_id
  end
end
