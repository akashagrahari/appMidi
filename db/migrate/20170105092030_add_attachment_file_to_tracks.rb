class AddAttachmentFileToTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.attachment :midi_file
    end
  end

  def self.down
    remove_attachment :tracks, :midi_file
  end
end
