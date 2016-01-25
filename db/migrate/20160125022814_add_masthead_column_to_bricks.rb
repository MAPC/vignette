class AddMastheadColumnToBricks < ActiveRecord::Migration
  def change
  	add_column :bricks, :masthead, :boolean, default: false
  end
end
