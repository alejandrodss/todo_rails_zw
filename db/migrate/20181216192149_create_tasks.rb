class CreateTasks < ActiveRecord::Migration[5.1]
  def up
    create_table :tasks do |t|
      t.text :description
      t.string :priority
      t.string :status, default: "pending"
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
