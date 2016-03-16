class Service < ActiveRecord::Base
  has_attached_file :service, styles: { medium: "512x512#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :service, content_type: /\Aimage\/.*\Z/

  translates :title, :description
end
