class TruckController < ApplicationController

  def update
      render :json => {:haha => params[:truck_id],
                       :hoh  => params[:lng],
                       :hack => params[:lat]
                      } 
  end


  def show
      #TODO: we have to look up the user and make sure he has the requested truck
      #      then if the truck is not already open and the user had permission to
      #      open the truck, we create an entry in the OpenTrucks table and create
      #      an access token that is written to that table, and return the token
      render :json => {:token => 'woah'}
  end

end
