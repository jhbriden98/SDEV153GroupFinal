class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.text :course_desc
      t.string :course_subj
      t.integer :course_cred
      t.integer :course_prof_id

      t.timestamps
    end
  end
end
