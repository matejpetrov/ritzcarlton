class GuestsController < ApplicationController

  def show
    @guest = current_employee.guests.find_by(id: params[:id])
    @visits = @guest.visits.all
    @visit = current_employee.visits.build if logged_in? 
  end
  

  def create
    @guest = current_employee.guests.build(guest_params)

    if @guest.save
      flash[:success] = "Added a new guest"
      redirect_to all_guests_url
    else
      render 'statis_pages/all_guests'
    end
  end

  def edit
    @guest = current_employee.guests.find_by(id: params[:id])
  end

  def update
    
    @guest = current_employee.guests.find_by(id: params[:id])        

    respond_to do |format|

      if @guest.update_attributes(guest_params)

        @guests = current_employee.guests.all

        format.html { }
        
        format.js { }

      else
        
      end


    end    

  end


  def modal_delete
    @guest = current_employee.guests.find_by(id: params[:id])
  end

  def destroy

    @guest = Guest.find_by(id: params[:id])

    respond_to do |format|

      if @guest.destroy

        @guests = current_employee.guests.all

        format.html { redirect_to all_guests_url, notice: 'Guest was successfully updated' }
        
        format.js { }

      else
        
      end

    end

  end


  private

    def guest_params
      params.require(:guest).permit(:guest_name, :guest_surname)
    end

end

