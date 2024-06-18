class ProjectUser < ApplicationRecord
  # associations
  belongs_to :project
  belongs_to :user
end
