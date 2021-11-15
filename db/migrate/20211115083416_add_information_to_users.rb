class AddInformationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :integer
    add_column :users, :home_town, :string
    add_column :users, :date_birth, :date
    add_column :users, :position, :string
    add_column :users, :status, :boolean
  end
end
