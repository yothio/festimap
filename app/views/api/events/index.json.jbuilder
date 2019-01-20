json.set! :events do
  json.array! @events do |event|
    json.extract! event, :id, :name, :date, :user_id, :is_allow_comment, :map, :created_at, :updated_at, :begin_time, :end_time, :description
  end
end