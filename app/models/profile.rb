class Profile < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :nickname, presence: true, uniqueness: true
end
