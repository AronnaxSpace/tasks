class RenameTaskEventsToTaskPerformances < ActiveRecord::Migration[7.0]
  def change
    rename_table :task_performances, :task_performances
  end
end
