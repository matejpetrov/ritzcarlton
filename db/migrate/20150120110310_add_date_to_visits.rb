class AddDateToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :arrival_date, :datetime
    add_column :visits, :departure_date, :datetime
  end
end
