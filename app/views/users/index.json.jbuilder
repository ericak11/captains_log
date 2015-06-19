json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :type, :password_digest, :password, :job_title, :active
  json.url user_url(user, format: :json)
end
