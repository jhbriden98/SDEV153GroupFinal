json.extract! teacher, :id, :teacher_name, :teacher_bio, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
