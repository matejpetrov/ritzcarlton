class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|

      t.references :employee, index: true

      t.string :guest_name
      t.string :guest_surname      

      t.timestamps null: false
    end
    add_foreign_key :guests, :employees
  end
end
