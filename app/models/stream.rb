class Stream < ActiveRecord::Base
  #primary_key = :public_id
  has_many :contents

  def self.search(q)
    if q
      #find(:all, :conditions => ['title LIKE ?', "%#{q}%"])
      Stream.where('title LIKE ? OR description LIKE ?', q, q)
    #else
    #  where('')
    end
  end
end
