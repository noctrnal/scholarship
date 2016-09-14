class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def status
    @submission = Submission.find_by_user_id(current_user.id)
    @radius = 90.0
    @percentage = 0

    @checklist = {
      :application => application_status,
      :recommendations => recommendations_status,
      :transcripts => transcripts_status,
      :approval => approval_status,
    }

    @offset = (100.0 - @percentage) / 100 * Math::PI * @radius * 2
  end

  private

  def increase_percentage_if(status)
    if status
      @percentage += 25
    end

    status
  end

  def application_status
    increase_percentage_if(@submission.present?)
  end

  def recommendations_status
    @recommendations = @submission.recommendations.
      where.not(:recommendation_updated_at => nil)
    increase_percentage_if(@recommendations.count > 3)
  end

  def transcripts_status
    @institutions = Institution.select(:id).where(:submission => @submission.id)
    @transcripts = Transcript.where(:institution => [@institutions])
      .where.not(:upload_updated_at => nil)
    increase_percentage_if(@institutions == @transcripts)
  end

  def approval_status
    increase_percentage_if(@submission.approval)
  end
end

