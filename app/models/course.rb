class Course < ApplicationRecord
    belongs_to :teacher
    has_many :schedules
    has_many :users, :through => :schedules
    def self.search(search)
      where("course_name LIKE ? OR course_subj LIKE ? OR course_desc LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
end
