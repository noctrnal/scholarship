class AddColumnsToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_reference :recommendations, :submission, foreign_key: true
    add_column :recommendations, :email, :string
  end
end
