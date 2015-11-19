class Content < ActiveRecord::Base
  belongs_to :stream
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
