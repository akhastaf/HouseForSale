class Banner < ActiveRecord::Base
  has_attached_file :banner, styles: { medium: "1500x800>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
end
