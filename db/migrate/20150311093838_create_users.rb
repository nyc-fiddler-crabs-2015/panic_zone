class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :mantra
      t.string :image_url
      t.timestamps
    end
  end
end
