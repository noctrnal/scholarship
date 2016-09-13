class RecommendationMailer < ApplicationMailer
  default from: "no-reply@najanet.org"

  def recommendation_confirmation(recommendation)
    @recommendation = recommendation
    @submission = Submission.find(@recommendation.submission)

    mail(to: @submission.user.email, subject: "#{@recommendation.email} has submitted a recommendation.")
  end
end
