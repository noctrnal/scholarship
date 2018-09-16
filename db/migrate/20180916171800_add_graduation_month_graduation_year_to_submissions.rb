class AddGraduationMonthGraduationYearToSubmissions < ActiveRecord::Migration[5.0]
  def self.up
    add_column :submissions, :graduation_month, :integer, :default => 0
    add_column :submissions, :graduation_year, :integer, :default => 0
  end

  def self.down
    remove_column :submissions, :graduation_month
    remove_column :submissions, :graduation_year
  end
end
