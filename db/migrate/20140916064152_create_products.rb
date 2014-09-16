class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :email
      t.string :productname
      t.string :productdes
      t.integer :canvasid

      t.timestamps
    end
  end
end
