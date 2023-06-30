class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name null: true
      t.string :photo
      t.text :bio
      t.integer :post_counter

      t.timestamps
    end
  end
end
