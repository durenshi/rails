json.extract! project, :id, :project_name, :project_type, :project_begin, :project_end, :is_delete, :created_at, :updated_at
json.url project_url(project, format: :json)
