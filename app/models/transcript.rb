class Transcript < ApplicationRecord
  belongs_to :institution

  has_attached_file :upload

  has_secure_token

  validates_attachment :upload, content_type: { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end

