class AddAttachmentFilmToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.attachment :film
    end
  end

  def self.down
    remove_attachment :movies, :film
  end
end
