module SubmissionsHelper
  def name(submission)
    "#{submission.last_name}, #{submission.first_name}"
  end

  def previous_submission(submission)
    previous_year = Setting.year - 1

    Submission.find_by(:user => submission.user, :year => previous_year)
  end
end
