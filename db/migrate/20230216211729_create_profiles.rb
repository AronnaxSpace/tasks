class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :nickname, null: false, index: { unique: true }
      t.string :time_zone

      t.timestamps
    end
  end
end
