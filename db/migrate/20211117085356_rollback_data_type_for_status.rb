class RollbackDataTypeForStatus < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :status, :boolean, default: true
  end

  def down
    change_column :users, :status, :string
  end
end
