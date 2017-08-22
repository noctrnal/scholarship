class AddYearToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :year, :integer, default: 2017
  end
end
