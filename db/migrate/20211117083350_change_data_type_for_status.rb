class ChangeDataTypeForStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :status, :string
  end
end
