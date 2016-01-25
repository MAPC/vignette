class FeaturesController < ApplicationController
	def index
		@features = Feature.all
	end

	def show
		@feature = Feature.find(params[:id])
	end

	def edit
		@feature = Feature.find(params[:id])
		@brick = Brick.new
	end

	def update
    @feature = Feature.find(feature_params[:id])
    @feature.update_attributes(feature_params)
    redirect_to @feature
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
      params.require(:feature).permit(:title, :id)
    end  
end
