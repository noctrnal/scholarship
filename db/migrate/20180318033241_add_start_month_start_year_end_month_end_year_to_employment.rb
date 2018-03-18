class AddStartMonthStartYearEndMonthEndYearToEmployment < ActiveRecord::Migration[5.0]
  def change
    add_column :employments, :start_month, :integer
    add_column :employments, :start_year, :integer
    add_column :employments, :end_month, :integer
    add_column :employments, :end_year, :integer
  end
end
