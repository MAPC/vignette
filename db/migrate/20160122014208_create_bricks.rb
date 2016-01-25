class CreateBricks < ActiveRecord::Migration
  def change
    create_table :bricks do |t|
    	t.boolean :wide, default: true
      t.json :configuration
      t.string :brick_type
      t.integer :position
    	t.belongs_to :feature
      t.timestamps null: false
    end
  end
end
