class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :teacher_name
      t.text :teacher_bio

      t.timestamps
    end
  end
end
