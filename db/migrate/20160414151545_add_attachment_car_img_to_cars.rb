class AddAttachmentCarImgToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :car_img
    end
  end

  def self.down
    remove_attachment :cars, :car_img
  end
end
