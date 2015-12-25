class AddAttachmentImageToProductimages < ActiveRecord::Migration
  def self.up
    change_table :productimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :productimages, :image
  end
end
