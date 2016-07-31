class AddTokenToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :token, :string
  end
end
