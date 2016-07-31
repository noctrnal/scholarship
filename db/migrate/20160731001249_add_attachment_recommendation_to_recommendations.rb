class AddAttachmentRecommendationToRecommendations < ActiveRecord::Migration
  def self.up
    change_table :recommendations do |t|
      t.attachment :recommendation
    end
  end

  def self.down
    remove_attachment :recommendations, :recommendation
  end
end
