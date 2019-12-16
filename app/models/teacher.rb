class Teacher < ApplicationRecord
    has_many :courses
    def self.search(search)
      where("teacher_name LIKE ?", "%#{search}%") 
    end
end
