class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :body
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end