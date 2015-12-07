class Stream < ActiveRecord::Base
  has_many :contents

  def self.search(q)
    Stream.where('expire_at > ? and (title LIKE ? OR description LIKE ?)', Time.now, '%'+q.to_s+'%', '%'+q.to_s+'%').includes(:contents) if q
  end

  def cache_key
    "#{model_name.cache_key}/#{id}/#{contents.size}"
  end

end
