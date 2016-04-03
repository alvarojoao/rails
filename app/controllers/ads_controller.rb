class AdsController < ApplicationController
# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	
	def new
		@ad = Ad.new
		@creative =  @ad.creatives.build 
		@targeting =  @ad.targetings.build 
		@generos = Targeting.generos

	end
	def index
		@ads = Ad.all
	end
	def edit
		@ad = Ad.find(params[:id])
	end
	def show
		@ad = Ad.find(params[:id])
		
		@generos = Targeting.generos
		
	end
	def destroy
		@ad = Ad.find(params[:id])
		@ad.destroy

		redirect_to ads_path
	end
	def update
		@ad = Ad.find(params[:id])

		if @ad.update(ad_params)
			redirect_to @ad
		else
			render 'edit'
		end
	end

	def create
		@ad = Ad.new(ad_params)
		if creative_params["creative"]["bid"].to_f > ad_params["budget"].to_f
			@ad.errors.add(:budget,"is smaller than bid")
			@creative =  @ad.creatives.build 
			@targeting =  @ad.targetings.build 
			@generos = Targeting.generos
			render 'new'
			# redirect_to new_ad_path()
		elsif creative_params["creative"]["adText"]=="" 
			@creative =  @ad.creatives.build 
			@creative.errors.add(:adText,"is blank")

			@targeting =  @ad.targetings.build 
			@generos = Targeting.generos
			render 'new'
		elsif creative_params["creative"]["bid"]==""
			@creative =  @ad.creatives.build 
			@creative.errors.add(:bid,"is blank")
			@targeting =  @ad.targetings.build 
			@generos = Targeting.generos
			render 'new'
		elsif targeting_place_params["targeting"]["address"]==""
			@creative =  @ad.creatives.build 
			@targeting =  @ad.targetings.build 
			@targeting.errors.add(:address,"is blank")
			@generos = Targeting.generos
			render 'new'
		else
			if @ad.save
				@creative = @ad.creatives.create(creative_params["creative"])
				@targeting = @ad.targetings.create(targeting_params["targeting"])
				@place = @targeting.places.create(targeting_place_params["targeting"])
				redirect_to @ad
			else

				@creative =  @ad.creatives.build 
				@targeting =  @ad.targetings.build 
				@generos = Targeting.generos
				render 'new'
				# redirect_to new_ad_path()
			end
		end 

	end


	private
		def ad_params
			params.require(:ad).permit(:budget)
		end
		def creative_params
			params.require(:ad).permit(creative: [:adText,:bid])
		end
		def targeting_params
			params.require(:ad).permit(targeting: [:genero])
		end
		def targeting_place_params
			params.require(:ad).permit(targeting: [:address])
		end
end


