module SessionHelper


  def log_in(employee)
    session[:employee_id] = employee.id
  end


  #function that returns the currently logged in user.
  def current_employee
    #either returns the current_employee, if it is initialized (has value), or looks for the logged in employee in the session. 
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end


  def logged_in?
    !current_employee.nil?
  end



  def log_out
    session.delete(:employee_id)
    @current_user = nil
  end

end
