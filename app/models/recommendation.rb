class Recommendation < ApplicationRecord
  belongs_to :submission

  has_attached_file :recommendation

  has_secure_token

  validates :email, :presence => true, :on => :create
  validates :recommendation, :presence => true, :on => :update

  validates_attachment :recommendation, content_type: { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
