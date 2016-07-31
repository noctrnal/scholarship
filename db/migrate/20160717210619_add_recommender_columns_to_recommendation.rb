class AddRecommenderColumnsToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :years, :float
    add_column :recommendations, :capacity, :string
    add_column :recommendations, :communication, :integer
    add_column :recommendations, :motivation, :integer
    add_column :recommendations, :habits, :integer
    add_column :recommendations, :responsibility, :integer
    add_column :recommendations, :personality, :integer
    add_column :recommendations, :maturity, :integer
    add_column :recommendations, :rating, :integer
    add_column :recommendations, :name, :string
    add_column :recommendations, :title, :string
    add_column :recommendations, :department, :string
    add_column :recommendations, :institution, :string
    add_column :recommendations, :address, :string
  end
end
