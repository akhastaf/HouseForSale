class House < ActiveRecord::Base

  has_attached_file :poster, styles: { medium: "300x300#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  translates :title, :description
end
