class CreateNudies < ActiveRecord::Migration[5.2]
  def change
    create_table :nudies do |t|
      t.integer :weight
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
