class Institution < ApplicationRecord
  belongs_to :submission

  has_one :transcript
end

