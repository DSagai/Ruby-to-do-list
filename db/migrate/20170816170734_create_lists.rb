class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.date :date
      t.string :link_token
      t.integer :user_id
      t.timestamps
    end

    add_index :lists, :user_id
    add_index :lists, :link_token
  end
end
