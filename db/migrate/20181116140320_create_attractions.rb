class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :img_url

      t.timestamps
    end
  end
end
