class TaskPerformancePolicy < ApplicationPolicy
  def complete?
    user == record.task.assignee
  end
end
