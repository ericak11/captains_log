json.array!(@expenses) do |expense|
  json.extract! expense, :id, :type, :category, :check_number, :check_to, :notes
  json.url expense_url(expense, format: :json)
end
