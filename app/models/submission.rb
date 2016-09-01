class Submission < ApplicationRecord
  belongs_to :user

  has_attached_file :expense
  has_attached_file :license
  has_attached_file :resume

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

  validates_attachment :expense, content_type: { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  validates_attachment :license, content_type: { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  validates_attachment :resume, content_type: { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  def field
    Field.find(degree_id)
  end

  def name
    "#{first_name} #{last_name}"
  end
end

