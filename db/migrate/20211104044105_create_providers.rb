class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.text :introduction
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :phone
      t.string :hp_url
      t.string :twitter_account
      t.string :insta_account
      t.string :facebook_account
      
      t.timestamps
    end
  end
end
