class CreateTasks < ActiveRecord::Migration[5.1]
  def up
    create_table :tasks do |t|
      t.text :description
      t.integer :priority
      t.string :status
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
