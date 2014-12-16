json.array!(@titles) do |title|
  json.extract! title, :id, :artist, :format, :length, :size
  json.url title_url(title, format: :json)
end
