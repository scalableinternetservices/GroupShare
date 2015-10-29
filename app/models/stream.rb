class Stream < ActiveRecord::Base
  #primary_key = :public_id
  has_many :contents
end
