class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, default: 'Blessing'
      t.string :photo, default: 'https://randomuser.me/api/portraits/women/70.jpg'
      t.text :bio, default: 'HEllo'
      t.integer :post_counter, default: 0

      t.timestamps
    end
  end
end
