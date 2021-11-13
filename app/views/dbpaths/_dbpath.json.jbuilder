json.extract! dbpath, :id, :project_id, :abbreviation, :sequence_type, :db_path, :created_at, :updated_at
json.url dbpath_url(dbpath, format: :json)
