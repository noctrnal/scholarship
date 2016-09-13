# Preview all emails at http://localhost:3000/rails/mailers/transcript_request_mailer
class TranscriptRequestMailerPreview < ActionMailer::Preview
  def preview
    TranscriptRequestMailer.transcript_request(Transcript.first)
  end
end

