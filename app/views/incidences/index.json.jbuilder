json.array!(@incidences) do |incidence|
  json.extract! incidence, :id, :body, :reservation_id
  json.url incidence_url(incidence, format: :json)
end
