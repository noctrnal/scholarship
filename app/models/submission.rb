class Submission < ApplicationRecord
  belongs_to :user

  has_many :employments
  has_many :honors
  has_many :institutions
  has_many :recommendations
  has_many :relatives
  has_many :volunteers

  accepts_nested_attributes_for :employments, :allow_destroy => true
  accepts_nested_attributes_for :relatives, :allow_destroy => true
  accepts_nested_attributes_for :institutions, :allow_destroy => true
  accepts_nested_attributes_for :honors, :allow_destroy => true
  accepts_nested_attributes_for :volunteers, :allow_destroy => true

  def field
    Field.find(degree_id)
  end
end

