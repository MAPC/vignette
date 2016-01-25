class BricksController < ApplicationController
  def create
    feature = Feature.find(params[:feature_id])
    feature.bricks.create(brick_params)
    redirect_to edit_feature_path(feature)
  end

  def new
    feature = Feature.find(params[:feature_id])
    @brick = Brick.new(brick_type: params[:brick_type], feature: feature)
  end

  def destroy
    feature = Feature.find(params[:feature_id])
    Brick.find(params[:id]).destroy
    redirect_to edit_feature_path(feature)
  end

  def edit
    @brick = Brick.find(params[:id])
  end

  def update
    feature = Feature.find(params[:feature_id])
    @brick = Brick.find(params[:id])
    @brick.update_attributes(brick_params)
    redirect_to edit_feature_path(feature)
  end

  def up
    feature = Feature.find(params[:feature_id])
    Brick.find(params[:brick_id]).move_higher
    redirect_to edit_feature_path(feature)
  end

  def down
    feature = Feature.find(params[:feature_id])
    Brick.find(params[:brick_id]).move_lower
    redirect_to edit_feature_path(feature)
  end

  def shrink
    feature = Feature.find(params[:feature_id])
    Brick.find(params[:brick_id]).update_attributes(wide: false)
    redirect_to edit_feature_path(feature)
  end

  def widen
    feature = Feature.find(params[:feature_id])
    Brick.find(params[:brick_id]).update_attributes(wide: true)
    redirect_to edit_feature_path(feature)
  end

  def mastheadify
    feature = Feature.find(params[:feature_id])
    Brick.find(params[:brick_id]).update_attributes(masthead: true)
    redirect_to edit_feature_path(feature)
  end

  def demastheadify
    feature = Feature.find(params[:feature_id])
    Brick.find(params[:brick_id]).update_attributes(masthead: false)
    redirect_to edit_feature_path(feature)
  end

  private 
    def brick_params
      params.require(:brick).permit(:brick_type, configuration: [:body, :chart_html, :map_html, :image_url])
    end  
end
