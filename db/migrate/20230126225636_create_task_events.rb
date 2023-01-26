class CreateTaskEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :task_events do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.text :comment
      t.string :aasm_state
      t.datetime :completed_at
      t.datetime :canceled_at

      t.timestamps
    end
  end
end
