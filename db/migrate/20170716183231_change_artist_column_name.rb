class ChangeArtistColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :artists, :image_url, :image
  end
end
