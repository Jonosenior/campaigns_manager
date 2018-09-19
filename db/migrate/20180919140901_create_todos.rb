class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :complete
      t.belongs_to :todo_list, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
