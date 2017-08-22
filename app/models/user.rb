class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions
  has_many :evaluations

  def submission
    Submission.find_by(:user => self, :year => Setting.year)
  end
end

