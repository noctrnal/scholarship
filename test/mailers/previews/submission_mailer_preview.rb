# Preview all emails at http://localhost:3000/rails/mailers/submission_mailer
class SubmissionMailerPreview < ActionMailer::Preview
  def preview
    SubmissionMailer.submission_confirmation(Submission.first)
  end
end
