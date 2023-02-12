class Task < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: true
  belongs_to :task_set, optional: true
  has_many :performances, class_name: 'TaskPerformance', dependent: :destroy

  # validations
  validates :title, presence: true

  accepts_nested_attributes_for :performances
end
