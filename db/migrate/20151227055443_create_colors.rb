class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :product_id
      t.string :color
      t.string :name

      t.timestamps null: false
    end
  end
end
