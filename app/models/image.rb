class Image < ActiveRecord::Base
  belongs_to :house
  has_attached_file :image, styles: {large: "1500x800"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
