class AddAttachmentServiceToServices < ActiveRecord::Migration
  def self.up
    change_table :services do |t|
      t.attachment :service
    end
  end

  def self.down
    remove_attachment :services, :service
  end
end
