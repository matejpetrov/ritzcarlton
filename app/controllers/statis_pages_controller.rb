class StatisPagesController < ApplicationController
  
  def home    
  end

  def about
  end

  def all_guests
    #if the employee is logged in, then we need to create a guest, but not to save it. 
    @guest = current_employee.guests.build if logged_in?
    @guests = current_employee.guests.all
  end
  
end
