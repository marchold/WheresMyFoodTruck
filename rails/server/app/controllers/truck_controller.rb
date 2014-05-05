require 'securerandom'

class TruckController < ApplicationController

  def update
     #TODO:
     #Validate that the token against the truck_id on the OpenTrucks table 
     #then write the longitute and latitude in to the table
     #we can return a simple result=>success result 
     truck = Truck.find_by_id(params[:truck_id])
     if (truck != nul)
       
     else

     end

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


      
      user = User.find_by_id(params[:user_id])
      if (user != nil) 

      	 truck = user.trucks.find_by_id(params[:truck_id])            
      	 if (truck != nil)

	     if (nil == (OpenTruck.find_by truck_id: truck.id))	    

	       #At this point we know the truck is not already open and we can go ahead and assign a token
               token = SecureRandom.urlsafe_base64(64)
	       OpenTruck.create(:truck_id => truck.id, :token => token)

	       render :json => { :token => token }
	    	    
             else
	       render :json => "Truck is already open"
             end

	 else
	    render :json => "invalid truck"
	 end
      else
	render :json => "invalid user"
      end
  end

end
