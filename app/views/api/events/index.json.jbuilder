json.set! :events do
  json.array! @events do |event|
    json.extract! event, :id, :name, :date, :user_id
  end
end