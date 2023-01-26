class Task < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: true
  belongs_to :task_set, optional: true

  # validations
  validates :title, presence: true
end
