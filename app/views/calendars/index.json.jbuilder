json.array!(@calendar) do |calender|
  json.extract! event, :id, :title
  json.start calender.start
  json.end calender.end
  json.url calender_url(calender, format: :html)
end
