json.array!(@songs) do |song|
  json.extract! song, :id, :artist, :album, :title
  json.url song_url(song, format: :json)
end
