class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :task_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :assignments, [:task_id, :user_id], unique: true
  end
end
