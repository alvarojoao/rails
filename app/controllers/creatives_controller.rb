class CreativesController < ApplicationController
	def new
		@creative = Creative.new
	end
	def index
		@creatives = Creative.all
	end
	def edit
		@creative = Creative.find(params[:id])
	end
	def show
		@creative = Creative.find(params[:id])
	end
	def destroy
		@creative = Creative.find(params[:id])
		@creative.destroy

		redirect_to creatives_path
	end
	def update
		@creative = Creative.find(params[:id])

		if @creative.update(creative_params)
			redirect_to @creative
		else
			render 'edit'
		end
	end

	def create
		@creative = Creative.new(creative_params)

		@creative.save
		redirect_to @creative
	end

	private
		def creative_params
			params.require(:creative).permit(:bid, :adText)
		end

end
