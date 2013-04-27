class AddNameOfAttrForFilepickerUrlToPhoto < ActiveRecord::Migration
    def up
        add_column :photos, :filepicker_url, :string
    end

    def down
        remove_column :photos, :filepicker_url
    end
end