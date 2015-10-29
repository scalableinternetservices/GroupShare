class Content < ActiveRecord::Base
  belongs_to :stream
  has_attached_file :file
  validates_attachment :file, content_type: {content_type: ["image/png", "image/jpeg", "image/jpg"]}
end
