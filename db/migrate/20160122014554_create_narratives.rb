class CreateNarratives < ActiveRecord::Migration
  def change
    create_table :narratives do |t|
    	t.string :body
    	t.belongs_to :brick
      t.timestamps null: false
    end
  end
end
