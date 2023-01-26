class Task < ApplicationRecord
  # associations
  belongs_to :task_set, optional: true

  # validations
  validates :title, presence: true
end
