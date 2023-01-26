class TaskSet < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: true
  has_many :tasks, dependent: :nullify

  # validations
  validates :title, presence: true
end
