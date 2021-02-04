class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :location, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
