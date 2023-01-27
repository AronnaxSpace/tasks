class TaskEvent < ApplicationRecord
  include AASM

  # associations
  belongs_to :task
  belongs_to :user

  # validations
  validates :start_at, presence: true
  validates :end_at, presence: true

  aasm timestamps: true do
    state :pending, initial: true
    state :completed, :canceled, :expired

    event :complete do
      transitions from: :pending, to: :completed
    end

    event :cancel do
      transitions from: :pending, to: :canceled
    end

    event :expire do
      transitions from: :pending, to: :expired
    end
  end
end
