class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.timestamp :deadline
      t.integer :count

      t.timestamps null: false
    end
  end
end
