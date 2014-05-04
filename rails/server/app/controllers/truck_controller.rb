class TruckController < ApplicationController

  def update
      render :json => {:haha => 'hoho'} 
  end


  def show
      render :json => {:dudo => 'woah'}
  end

end
