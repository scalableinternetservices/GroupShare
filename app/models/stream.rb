class Stream < ActiveRecord::Base
  has_many :contents
  def self.search(q)
    if q
      #find(:all, :conditions => ['title LIKE ?', "%#{q}%"])
      Stream.where('title LIKE ? OR description LIKE ?', '%'+q.to_s+'%', '%'+q.to_s+'%')
      #else
      #  where('')
    end
  end

end
