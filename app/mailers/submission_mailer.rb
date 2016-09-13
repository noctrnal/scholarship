class SubmissionMailer < ApplicationMailer
  default from: "no-reply@najanet.org"

  def submission_confirmation(submission)
    @submission = submission

    mail(to: @submission.user.email, subject: "#{@submission.name} has submitted a NAJA scholarship application.")
  end
end
