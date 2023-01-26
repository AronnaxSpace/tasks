class AddUserAndAssigneeRefToTaskSetsAndTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :task_sets, :user, null: false, foreign_key: true
    add_reference :task_sets, :assignee, foreign_key: { to_table: :users }

    add_reference :tasks, :user, null: false, foreign_key: true
    add_reference :tasks, :assignee, foreign_key: { to_table: :users }
  end
end
