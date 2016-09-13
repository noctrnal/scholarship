class TranscriptMailer < ApplicationMailer
  default from: "no-reply@najanet.org"

  def transcript_confirmation(transcript)
    @transcript = transcript
    @submission = Submission.find(@transcript.institution.submission_id)

    mail(to: @submission.user.email, subject: "An official transcript has been submitted from #{@transcript.institution.name}.")
  end
end
