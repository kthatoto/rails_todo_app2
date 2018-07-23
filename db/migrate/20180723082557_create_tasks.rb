class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string  :content, null: false, default: ""
      t.integer :status, null: false, default: 0
      t.timestamps
    end

    add_index :tasks, :status
  end
end
