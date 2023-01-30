class TaskPolicy < ApplicationPolicy
  def show?
    user == record.user || user == record.assignee
  end
end
