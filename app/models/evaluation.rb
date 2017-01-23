class Evaluation < ApplicationRecord
  belongs_to :submission
  belongs_to :user

  validates_uniqueness_of :user, :scope => :submission
end
