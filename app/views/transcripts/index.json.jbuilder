json.array!(@transcripts) do |transcript|
  json.extract! transcript, :id
  json.url transcript_url(transcript, format: :json)
end
