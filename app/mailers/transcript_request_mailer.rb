class TranscriptRequestMailer < ApplicationMailer
  default from: "no-reply@najanet.org"

  def transcript_request(transcript)
    @transcript = transcript
    @submission = Submission.find(@transcript.institution.submission_id)

    mail(to: @transcript.email, subject: "#{@submission.name} requests an official transcript.")
  end
end
