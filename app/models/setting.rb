class Setting < ApplicationRecord
  def self.year
    Setting.first.current_year
  end
end
