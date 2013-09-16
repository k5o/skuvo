class CreateAlbumsTable < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :url
      t.references :user
      t.timestamps
    end
  end
end