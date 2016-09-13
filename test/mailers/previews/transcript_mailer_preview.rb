class TranscriptMailerPreview < ActionMailer::Preview
  def preview
    TranscriptMailer.transcript_confirmation(Transcript.first)
  end
end

