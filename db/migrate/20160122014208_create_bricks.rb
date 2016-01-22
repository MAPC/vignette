class CreateBricks < ActiveRecord::Migration
  def change
    create_table :bricks do |t|
    	t.boolean :wide, default: true
    	t.belongs_to :row
      t.timestamps null: false
    end
  end
end
