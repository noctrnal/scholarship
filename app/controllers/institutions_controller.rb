class InstitutionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @submission = Submission.find_by_user_id(current_user.id)
    if @submission
      @institutions = Institution.where(:submission_id => @submission.id)
    else
      redirect_to dashboard_home_path, :notice => "Please complete scholarship application first."
    end
  end
end

