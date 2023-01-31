class TaskPerformancePolicy < ApplicationPolicy
  def complete?
    record.active? && user == record.task.assignee
  end
end
