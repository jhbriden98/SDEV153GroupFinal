json.extract! course, :id, :course_name, :course_desc, :course_subj, :course_cred, :teacher_id, :created_at, :updated_at
json.url course_url(course, format: :json)
