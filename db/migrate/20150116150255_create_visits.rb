class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :nights
      t.decimal :price
      t.references :guest, index: true
      t.references :employee, index: true

      t.timestamps null: false
    end
    add_foreign_key :visits, :guests
    add_foreign_key :visits, :employees
  end
end
