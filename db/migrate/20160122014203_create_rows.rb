class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
    	t.belongs_to :feature
      t.timestamps null: false
    end
  end
end
