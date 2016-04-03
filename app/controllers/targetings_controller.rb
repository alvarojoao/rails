class TargetingsController < ApplicationController

	
	def destroy
		@ad = Ad.find(params[:ad_id])
		@targeting =  @ad.targetings.create(params[:id]) 
		@targeting.destroy

		redirect_to ad_path(@ad)
	end
	def create
		@ad = Ad.find(params[:ad_id])
		if targeting_place_params["places"]["address"]==""	
			@creative =  @ad.creatives.build 
			@targeting =  @ad.targetings.build 
			@targeting.errors.add(:address,"is blank")
			@generos = Targeting.generos
		else
			@targeting =  @ad.targetings.create(targeting_params) 
			@place = @targeting.places.create(targeting_place_params["places"])
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
