require 'securerandom'

class TruckController < ApplicationController

  #Validate that the token against the truck_id on the OpenTrucks table
  #then write the longitude and latitude in to the table
  #we can return a simple result=>success result
  def update
    truck = Truck.find_by_id(params[:truck_id])
    if (truck != nil)
      openTruck = OpenTruck.find_by(:truck_id => truck.id)
      if (openTruck != nil)
        truck.lat = params[:lat]
        truck.lng = params[:lng]
        truck.save
        render :json => "Updated truck location"
      else
        render :json => "Truck is not open"
      end
    else
      render :json => "Invalid Truck Id"
    end

  end


  #We have to look up the user and make sure he has the requested truck
  #then if the truck is not already open and the user had permission to
  #open the truck, we create an entry in the OpenTrucks table and create
  #an access token that is written to that table, and return the token
  def show
      user = User.find_by_id(params[:user_id])
    if (user != nil)

      truck = user.trucks.find_by_id(params[:truck_id])
      if (truck != nil)

        if (nil == (OpenTruck.find_by truck_id: truck.id))

          #At this point we know the truck is not already open and we can go ahead and assign a token
          token = SecureRandom.urlsafe_base64(64)
          OpenTruck.create(:truck_id => truck.id, :token => token)

          render :json => {:token => token}

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


  #Get a list of open trucks that are nearby
  def nearby

    #select * from ( select * from Location
    #        WHERE Longitude > @lngA-(@dist/(cos( radians(@latA+(@dist/68.703)))*69.172))
    #         AND Longitude < @lngA+(@dist/(cos( radians(@latA+(@dist/68.703)))*69.172))
    #         AND Latitude > @latA-(@dist/68.703)
    #         AND Latitude < @latA+(@dist/68.703) ) AS `tmp` WHERE GEODISTANCE(@latA,@lngA ,Latitude,Longitude) < @dist

    #Calculate a bounding box we can use to quickly find nearby trucks
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    dist = params[:radius].to_f
    latDelta = dist/68.703

    value = lat+(latDelta);
    rad = value/180 * Math::PI  #Geocoder::Calculations.to_radians(value) #value.to_ra  radians(value);

    lngDelta = dist/(Math.cos( rad)*69.172)
    minLng = lng-lngDelta
    maxLng = lng+lngDelta
    minLat = lat-latDelta
    maxLat = lat+latDelta


    #IFNULL( SQRT(((difX)(difX))+((difY)(difY))), 99999)
    trucks = Truck.find_by_sql "SELECT trucks.* WHERE SQRT(((trucks.lng-#{lng})(trucks.lng-#{lng}))+((trucks.lat-#{lat})(trucks.lat-#{lat}))) < #{dist}"

    render :json => trucks
  end

end
