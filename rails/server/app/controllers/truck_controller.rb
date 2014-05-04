class TruckController < ApplicationController

  def update
      render :json => {:haha => params[:truck_id],
                       :hoh  => params[:lng],
                       :hack => params[:lat]
                      } 
  end


  def show
      render :json => {:dudo => 'woah'}
  end

end
