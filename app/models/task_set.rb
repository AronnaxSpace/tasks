class TaskSet < ApplicationRecord
  # associations
  has_many :tasks

  # validations
  validates :title, presence: true
end
