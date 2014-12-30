class GuestsController < ApplicationController

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
    @guest = current_employee.guest.find_by(id: params[:id])    

    if @guest.update_attributes(guest_params)

    else

    end

  end

  def destroy

  end


  private

    def guest_params
      params.require(:guest).permit(:guest_name, :guest_surname)
    end

end

