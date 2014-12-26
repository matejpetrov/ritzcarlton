class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :position, index: true

      t.string :name
      t.string :surname
      t.datetime :birth_date
      t.datetime :hired_date
      t.string :username
      t.string :password      

      t.timestamps null: false
    end
    add_foreign_key :employees, :positions
  end
end
