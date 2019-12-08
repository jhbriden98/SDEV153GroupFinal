class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :cname
      t.text :desc
      t.string :subj
      t.integer :credits
      t.string :prof

      t.timestamps
    end
  end
end
