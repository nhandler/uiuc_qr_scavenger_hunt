json.array!(@codes) do |code|
  json.extract! code, :id, :name, :clue, :location, :specific_location, :alum, :secret
  json.url code_url(code, format: :json)
end
