class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :status, default: 0, null:false, limit:1
      t.string :prefecture
      t.string :city
      t.string :address
      t.text :text
      t.integer :provider_id
      t.integer :show_count
      
      t.timestamps
    end
  end
end
