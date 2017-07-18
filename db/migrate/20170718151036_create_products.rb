class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :name
    	t.datetime :expire_date
    	t.integer :price
    	t.integer :sku_id
    end
  end
end
