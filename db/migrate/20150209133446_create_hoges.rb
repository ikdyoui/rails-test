class CreateHoges < ActiveRecord::Migration
  def change
    create_table :hoges do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :coffee

      t.timestamps null: false
    end
  end
end
