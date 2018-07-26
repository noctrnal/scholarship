class ChangeCommitmentScholarshipRecommendationsGoalsToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :evaluations, :commitment, :float
    change_column :evaluations, :scholarship, :float
    change_column :evaluations, :recommendations, :float
    change_column :evaluations, :goals, :float
  end
end
