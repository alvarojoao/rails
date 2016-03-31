class TargetingsController < ApplicationController

	def new
		@targeting = Targeting.new
		@generos = Targeting.generos
	end
	def index
		@targetings = Targeting.all
	end
	def edit
		@targeting = Targeting.find(params[:id])
		@generos = Targeting.generos
	end
	def show
		@targeting = Targeting.find(params[:id])
	end
	def destroy
		@targeting = Targeting.find(params[:id])
		@targeting.destroy

		redirect_to targetings_path
	end
	def update
		@targeting = Targeting.find(params[:id])

		if @targeting.update(targeting_params)
			redirect_to @targeting
		else
			render 'edit'
		end
	end

	def create
		@targeting = Targeting.new(targeting_params)

		@targeting.save
		redirect_to @targeting
	end

	private
		def targeting_params
			params.require(:targeting).permit(:places, :genero)
		end

end
