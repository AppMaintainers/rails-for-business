class CreateStudentsWorksJoinTable < ActiveRecord::Migration
  def change
    create_table :students_works, id: false do |t|
      t.integer :work_id
      t.integer :student_id
    end
  end
end
