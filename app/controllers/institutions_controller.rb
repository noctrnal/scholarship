class InstitutionsController < ApplicationController
  def index
    @submission = Submission.find_by_user_id(current_user.id)
    if @submission
      @institutions = Institution.where(:submission_id => @submission.id)
    else
      redirect_to dashboard_home_path
    end
  end
end

