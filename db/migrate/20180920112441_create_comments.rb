class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.belongs_to :campaign, index: true
      t.belongs_to :todo_list, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
