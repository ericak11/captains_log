json.array!(@open_items) do |open_item|
  json.extract! open_item, :id, :task, :date, :user_id, :notes, :completed
  json.url open_item_url(open_item, format: :json)
end
