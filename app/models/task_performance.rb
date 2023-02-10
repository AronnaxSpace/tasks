class TaskPerformance < ApplicationRecord
  include AASM

  # associations
  belongs_to :task
  belongs_to :user

  # validations
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :comment, presence: true, if: :completed?, length: { in: 20..1_000 }
  validate :ends_in_the_future, on: :create
  validate :ends_later_than_starts

  # scopes
  scope :active, -> { where(aasm_state: 'pending').where('start_at <= :now and end_at > :now', now: Time.current) }
  scope :future, -> { where('start_at > :now', now: Time.current) }
  scope :past, -> { where('end_at <= :now', now: Time.current) }

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

  def active?
    pending? && start_at <= Time.current && end_at > Time.current
  end

  def ends_in_the_future
    return unless end_at
    return if end_at > Time.current

    errors.add(:end_at, 'should be in the future')
  end

  def ends_later_than_starts
    return unless end_at && start_at
    return if end_at > start_at

    errors.add(:base, 'Incorrect timestamps')
  end
end
