class AddSubmissionToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :submission, foreign_key: true
  end
end
