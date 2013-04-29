class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, :null => false
      t.string :name
      t.integer :inn
      t.references :city
      t.references :region
      t.string :address
      t.string :phone
      t.string :desc

      t.timestamps
    end
    add_index :profiles, :user_id
    add_index :profiles, :city_id
    add_index :profiles, :region_id
  end
end
