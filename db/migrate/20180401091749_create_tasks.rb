class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :question_id
      t.string :view

      t.timestamps
    end
  end
end
