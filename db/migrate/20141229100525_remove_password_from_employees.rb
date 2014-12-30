class RemovePasswordFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :password, :string
  end
end
