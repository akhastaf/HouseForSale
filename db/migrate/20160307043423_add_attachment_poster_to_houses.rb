class AddAttachmentPosterToHouses < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.attachment :poster
    end
  end

  def self.down
    remove_attachment :houses, :poster
  end
end
