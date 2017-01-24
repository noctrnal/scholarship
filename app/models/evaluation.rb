class Evaluation < ApplicationRecord
  belongs_to :submission
  belongs_to :user

  validates_uniqueness_of :user, :scope => :submission

  def score
    commitment_total + scholarship_total + recommendations_total + goals_total
  end

  private

  def commitment_total
    commitment || 0
  end

  def goals_total
    goals || 0
  end

  def recommendations_total
    recommendations || 0
  end

  def scholarship_total
    scholarship || 0
  end
end

