class AddMonthYearToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :studies_month, :integer
    add_column :submissions, :studies_year, :integer
  end
end
