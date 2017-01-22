module SubmissionsHelper
  def name(submission)
    "#{submission.last_name}, #{submission.first_name}"
  end
end
