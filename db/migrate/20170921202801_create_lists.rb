class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name_string
      t.integer :user_id

      t.timestamps
    end
  end
end
