class Submission < ApplicationRecord
  belongs_to :user

  has_attached_file :expense
  has_attached_file :license
  has_attached_file :resume

  has_many :employments
  has_many :evaluations
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

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :permanent_address, :presence => true
  validates :permanent_city, :presence => true
  validates :permanent_state, :presence => true
  validates :permanent_zip, :presence => true
  validates :permanent_phone, :presence => true
  validates :citizen, :presence => true
  validates :field_id, :presence => true
  validates :degree_id, :presence => true
  validates :institution_name, :presence => true
  validates :institution_city, :presence => true
  validates :institution_state, :presence => true
  validates :summer_tuition, :presence => true
  validates :summer_books, :presence => true
  validates :summer_board, :presence => true
  validates :summer_other, :presence => true
  validates :summer_hours, :presence => true
  validates :fall_tuition, :presence => true
  validates :fall_books, :presence => true
  validates :fall_board, :presence => true
  validates :fall_other, :presence => true
  validates :fall_hours, :presence => true
  validates :winter_tuition, :presence => true
  validates :winter_books, :presence => true
  validates :winter_board, :presence => true
  validates :winter_other, :presence => true
  validates :winter_hours, :presence => true
  validates :spring_tuition, :presence => true
  validates :spring_books, :presence => true
  validates :spring_board, :presence => true
  validates :spring_other, :presence => true
  validates :spring_hours, :presence => true
  validates :frequency, :presence => true
  validates :motivation, :presence => true, :unless => :reapply?
  validates :license, attachment_presence: true, :unless => :reapply?
  validates :resume, attachment_presence: true, :unless => :reapply?
  validates :expense, attachment_presence: true

  def field
    Field.find(field_id)
  end

  def name
    "#{first_name} #{last_name}"
  end
end

