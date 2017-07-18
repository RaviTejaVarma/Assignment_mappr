class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
    	t.string :name
    	t.integer :product_id
    end
  end
end
