class AddPictureToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :picture, :string
  end
end
