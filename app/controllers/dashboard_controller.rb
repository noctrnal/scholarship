class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def status
    if @submission = current_user.submission
      @radius = 90.0
      @percentage = 0

      @checklist = {
        :application => application_status,
        :recommendations => recommendations_status,
        :transcripts => transcripts_status,
        :approval => approval_status,
      }

      @offset = (100.0 - @percentage) / 100 * Math::PI * @radius * 2
    else
      redirect_to dashboard_home_path, :notice => "Please complete scholarship application first."
    end
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
    @required = @submission.reapply ? 2 : 3
    @recommendations = @submission.recommendations.
      where.not(:recommendation_updated_at => nil)
    increase_percentage_if(@recommendations.count >= @required)
  end

  def transcripts_status
    @institutions = Institution.select(:id).where(:submission => @submission.id)
    @transcripts = Transcript.where(:institution => [@institutions])
      .where.not(:upload_updated_at => nil)
    increase_percentage_if(@institutions.count == @transcripts.count)
  end

  def approval_status
    increase_percentage_if(@submission.approval)
  end
end

