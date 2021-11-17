class AddFkToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :department_id, :integer
    add_foreign_key :users, :departments, index: true, foreign_key: true
  end
end
