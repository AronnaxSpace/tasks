class Project < ApplicationRecord
  # associations
  belongs_to :owner, class_name: 'User'
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :tasks

  # validations
  validates :code, presence: true, length: { in: 2..4 }
  validates :name, presence: true, length: { maximum: 50 }

  before_save :upcase_code
  after_create :make_owner_project_user

  private

  def upcase_code
    self.code = code.upcase
  end

  def make_owner_project_user
    users << owner
  end
end
