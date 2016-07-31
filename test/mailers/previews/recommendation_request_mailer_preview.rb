# Preview all emails at http://localhost:3000/rails/mailers/recommendation_request_mailer
class RecommendationRequestMailerPreview < ActionMailer::Preview
  def preview
    RecommendationRequestMailer.recommendation_request(Recommendation.first)
  end
end

