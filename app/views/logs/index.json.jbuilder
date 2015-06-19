json.array!(@logs) do |log|
  json.extract! log, :id, :pdf, :date, :created_by
  json.url log_url(log, format: :json)
end
