class ListsPrimaryKeyChange < ActiveRecord::Migration[5.1]
  def change
    drop_table :tasks

    remove_column :lists, :id

    create_table :tasks do |t|
      t.string :task_body
      t.boolean :done, default: false
      t.string :list_id
      t.timestamps
    end

    add_index :tasks, :list_id
    add_index :tasks, :done

  end
end
