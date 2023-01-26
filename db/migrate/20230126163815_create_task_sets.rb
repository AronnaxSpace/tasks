class CreateTaskSets < ActiveRecord::Migration[7.0]
  def change
    create_table :task_sets do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
