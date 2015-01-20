class VisitsController < ApplicationController
  
  def create

    @guest_id = params[:guest_id]

    @visit = current_employee.visits.build(
          visit_params.merge(
            :guest_id => @guest_id
    ))    

    @guest = Guest.find_by(id: @guest_id)

    respond_to do |format|

      if @visit.save

        @visits = @guest.visits.all

        format.html { }
        
        format.js { }

      else
        


      end

    end

  end

  def edit
     
    @visit = current_employee.visits.find_by(id: params[:id])
    
    
    @visit.arrival_date = @visit.arrival_date.strftime("%d/%m/%Y")    
    @visit.departure_date = @visit.departure_date.strftime("%d/%m/%Y")
    
    guest_id = @visit.guest_id

    @guest = Guest.find_by(id: guest_id)  
    
  end

  def update

    @visit = current_employee.visits.find_by(id: params[:id])
    @guest = Guest.find_by(id: params[:guest_id])       

    respond_to do |format|

      if @visit.update_attributes(visit_params)

        @visits = @guest.visits.all

        format.html { }
        
        format.js { }

      else
        
      end


    end
  end

  def destroy
  end


  private

    def visit_params
      params.require(:visit).permit(:nights, :price, :arrival_date, :departure_date)
    end

end
