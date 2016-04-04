class CreativesController < ApplicationController

	def create
		@ad = Ad.find(params[:ad_id])
		if creative_params["bid"].to_f > @ad.budget
			@creative =  @ad.creatives.build 
			@creative.errors.add(:bid,"is bigger than budget")
			# redirect_to new_ad_path()
		elsif creative_params["adText"]=="" 
			@creative =  @ad.creatives.build 
			@creative.errors.add(:adText,"is blank")

		elsif creative_params["bid"]==""
			@creative =  @ad.creatives.build 
			@creative.errors.add(:bid,"is blank")
		else
			@creative =  @ad.creatives.create(creative_params)
		end
		@ad.save
		redirect_to ad_path(@ad)
	end
	def destroy
		@ad = Ad.find(params[:ad_id])
		if @ad.creatives.count >1
			@creative = @ad.creatives.find(params[:id])
			@creative.destroy
		end
		redirect_to ad_path(@ad)
	end
	private
		def creative_params
			params.require(:creative).permit(:bid, :adText)
		end

end
