class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :code, limit: 4
      t.string :name, limit: 50
      t.string :description
      t.belongs_to :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
