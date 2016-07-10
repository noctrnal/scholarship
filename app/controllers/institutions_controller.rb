class InstitutionsController < ApplicationController
  def index
    @submission = Submission.find_by_user_id(current_user.id)
    @institutions = Institution.where(:submission_id => @submission.id)
  end
end

