class Stream < ActiveRecord::Base
  has_many :contents

  def self.search(q)
    Stream.where('expire_at > ? and (title LIKE ? OR description LIKE ?)', Time.now, '%'+q.to_s+'%', '%'+q.to_s+'%') if q
  end

end
