class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, unique: true
      t.string :address

      t.timestamps
    end
  end
end
