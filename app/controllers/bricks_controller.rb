class BricksController < ApplicationController
  def create
    @brick = Brick.new(brick_params)
    if @brick.save
      redirect_to edit_feature_path(@brick)
    else
      redirect_to new_feature_path
    end
  end

  def feature_params
    params.require(:feature).permit(:configuration)
  end  
end
