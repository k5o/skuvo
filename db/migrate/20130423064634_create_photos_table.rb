class CreatePhotosTable < ActiveRecord::Migration
	def change
    create_table :photos do |t|
      t.string :url
      t.string :short_url
      t.references :user
      t.references :album
      t.timestamps
    end
  end
end
