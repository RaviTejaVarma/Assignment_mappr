class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
    	t.string :img_path
    	t.integer :product_id
    end
  end
end
