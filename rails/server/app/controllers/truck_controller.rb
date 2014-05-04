require 'securerandom'

class TruckController < ApplicationController

  def update
     #TODO:
     #Validate that the token against the truck_id on the OpenTrucks table 
     #then write the longitute and latitude in to the table
     #we can return a simple result=>success result 
     render :json => {:haha => params[:truck_id],
                       :hoh  => params[:lng],
                       :hack => params[:lat],
		       :do => params[:token]
                      } 
  end


  def show
      #TODO: we have to look up the user and make sure he has the requested truck
      #      then if the truck is not already open and the user had permission to
      #      open the truck, we create an entry in the OpenTrucks table and create
      #      an access token that is written to that table, and return the token
      random_string = SecureRandom.urlsafe_base64(64)
      userId = params[:userId]
      truckId = params[:truck_id]
      
      render :json => {:token => random_string, :truck_id => params[:truck_id], :user_id => params[:user_id]}
  end

end
