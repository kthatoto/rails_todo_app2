class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string  :content, null: false, default: ""
      t.integer :istatus, null: false, default: 0
      t.timestamps
    end
  end
end
