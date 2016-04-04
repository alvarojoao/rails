class PlacesController < ApplicationController
	def create
		@ad = Ad.find(params[:ad_id])
		@targeting = @ad.targetings.find(params[:targeting_id])
		if place_params["address"]!=""	
			@targeting.places.create(place_params)
			@ad.save
		end
		redirect_to ad_path(@ad)
	end
	def destroy
		@ad = Ad.find(params[:ad_id])
		@targeting = @ad.targetings.find(params[:targeting_id])
		@place = @targeting.places.find(params[:id])
		@place.destroy
		redirect_to ad_path(@ad)
	end

	private
		def place_params
			params.require(:place).permit(:address)
		end
end
