class Content < ActiveRecord::Base
  belongs_to :stream, touch: true
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  def cache_key
    "#{model_name.cache_key}/#{id}"
  end

end
