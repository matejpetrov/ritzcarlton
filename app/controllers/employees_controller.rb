class EmployeesController < ApplicationController

  before_action :parameters_for_new, only: [ :new, :edit ]

  def new

    @employee = Employee.new
  end

  def create
    Rails.logger.info params

    birth_date_day = params[:birth_date_day]
    birth_date_month = params[:birth_date_month]    
    birth_date_year = params[:birth_date_year]
    position_id = params[:position_id]

    birth_date = Date.new(birth_date_year.to_i, birth_date_month.to_i, birth_date_day.to_i)
    birth_date_format = birth_date.strftime('%d/%m/%Y')

    

    ep = employee_params

    ep[:birth_date] = birth_date_format
    #if no position ID is enteres, we set it to null, so that the validation fails, and we inform the user that he must choose position
    if position_id == '-'
      position_id = nil
    end

    ep[:position_id] = position_id     

    @employee = Employee.new(ep)

    if @employee.save
      log_in @employee
      flash[:info] = "Your profile was successfully created"
      redirect_to @employee
    else
      #redirect_to signup_url
      parameters_for_new
      render 'new'
    end
  end

  def show
    @employee = Employee.find(params[:id])    
    position = Position.find(@employee.position_id)
    @position_name = position.label
  end

  def edit
    @employee = Employee.find(params[:id])    
  end

  def update

    @employee = Employee.find(params[:id])

    birth_date_day = params[:birth_date_day]
    birth_date_month = params[:birth_date_month]    
    birth_date_year = params[:birth_date_year]
    position_id = params[:position_id]

    birth_date = Date.new(birth_date_year.to_i, birth_date_month.to_i, birth_date_day.to_i)
    birth_date_format = birth_date.strftime('%d/%m/%Y')

    ep = employee_params

    ep[:birth_date] = birth_date_format
    #if no position ID is enteres, we set it to null, so that the validation fails, and we inform the user that he must choose position
    if position_id == '-'
      position_id = nil
    end

    ep[:position_id] = position_id

    if @employee.update_attributes(ep)
      flash[:success] = "Your information were successfully updated"
      redirect_to @employee

    else
      parameters_for_new
      render 'edit'
    end


  end


  private
    def employee_params
      params.require(:employee).permit(:name, :surname, :username, :password, :hired_date)
    end


    #get all the additional parameters given to the edit and new views. These information are: all the positions, days, months and
    #years for the birth date. 
    def parameters_for_new
      @positions = [ [ '-', '' ] ]
      @positions += Position.all.map{|p| [ p.label, p.id ] }   

      @days = [['-', '']]

      (1..31).each do |d|
        @days[d] = [d, d]
      end    

      @months = [['-', '']]

      (1..12).each {|m| @months[m] = [Date::MONTHNAMES[m], m] }      

      @years = [['-', '']]

      current_year = Time.new.year    
      counter = 1

      (1991..current_year).each {
        |y| @years[counter] = [y, y]
        counter += 1 
      }
    end

end
