class AddStartMonthToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :start_date, :timestamp
  end
end
