class SessionController < ApplicationController
  
  def new    
  end


  def create

    username = params[:session][:username]
    password = params[:session][:password]

    employee = Employee.find_by(username: username)


    #if the user is right we need to save the employee id in session variable and set the current user value to the user from the databse
    #with the corresponding ID. 
    if employee && employee.authenticate(password)

      #Session Helper method - stores the employee ID in session
      log_in employee
      redirect_to employee

    else
      flash[:danger] = "The username/password combination is not valid. Try again"
      render 'new'
    end
  end

  def destroy
    #destroy the session for the employee if there was one who was logged in. 
    log_out if logged_in?
    redirect_to root_url
  end

end
