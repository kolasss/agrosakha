class CreateCountTypes < ActiveRecord::Migration
  def change
    create_table :count_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
