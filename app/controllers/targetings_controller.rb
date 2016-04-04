class TargetingsController < ApplicationController

	
	def destroy
		@ad = Ad.find(params[:ad_id])
		if @ad.targetings.count >1
			@targeting =  @ad.targetings.find(params[:id]) 
			@targeting.destroy
		end
		redirect_to ad_path(@ad)
	end
	def create
		@ad = Ad.find(params[:ad_id])
		@generos = Targeting.generos
		@targeting =  @ad.targetings.create(targeting_params) 
		if targeting_place_params["places"]["address"]!=""	
			@place = @targeting.places.create(targeting_place_params["places"])
		end
		@ad.save
		redirect_to ad_path(@ad)
	end

	private
		def targeting_params
			params.require(:targeting).permit(:genero)
		end
		def targeting_place_params
			params.require(:targeting).permit(places:[:address])
		end

end
