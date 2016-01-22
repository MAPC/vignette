class FeaturesController < ApplicationController
	def index
		@features = Feature.all
	end

	def show
		@feature = Feature.first(params[:id])
	end

	def edit
		@feature = Feature.find(params[:id])
		@narrative = Narrative.new
	end

	def new 
		@feature = Feature.new
	end

	def create
		@feature = Feature.new(feature_params)
		if @feature.save
			redirect_to edit_feature_path(@feature)
		else
			redirect_to new_feature_path
		end
	end

  private
    def feature_params
      params.require(:feature).permit(:title)
    end  

end
