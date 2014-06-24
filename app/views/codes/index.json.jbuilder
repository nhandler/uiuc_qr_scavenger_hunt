json.array!(@codes) do |code|
  json.extract! code, :id, :name, :clue, :location, :secret
  json.url code_url(code, format: :json)
end
