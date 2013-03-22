class AddGenreToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :genre_id, :integer
    add_index :movies, :genre_id
  end
end
