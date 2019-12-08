json.extract! course, :id, :cname, :desc, :subj, :credits, :prof, :created_at, :updated_at
json.url course_url(course, format: :json)
