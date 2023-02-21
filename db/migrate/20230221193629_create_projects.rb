class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :code
      t.string :name
      t.belongs_to :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
