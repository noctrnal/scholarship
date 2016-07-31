class RecommendationRequestMailer < ApplicationMailer
  default from: "no-reply@najanet.org"

  def recommendation_request(recommendation)
    @recommendation = recommendation
    @submission = @recommendation.submission
    @name = "#{@submission.first_name} #{@submission.last_name}"

    mail(to: @recommendation.email, subject: "#{@submission.first_name} #{@submission.last_name} requests a scholarship recommendation.")
  end
end
