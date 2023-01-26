class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.belongs_to :task_set, foreign_key: true

      t.timestamps
    end
  end
end
