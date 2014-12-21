class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :slug
      t.index :slug, unique: true
      t.timestamps null: false
    end
  end
end
