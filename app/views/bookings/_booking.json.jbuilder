json.extract! booking, :id, :court_name, :start_time, :duration, :price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
