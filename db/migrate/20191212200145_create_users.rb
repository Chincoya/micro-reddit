class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 50, unique: true
      t.string :email, limit: 255, unique: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
