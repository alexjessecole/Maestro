class AddAttachmentSongToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :song
    end
  end

  def self.down
    remove_attachment :songs, :song
  end
end
