class AccessUrl < ActiveRecord::Base
  belongs_to :url
  
 # scope :recents, where("created_at > ?", Time.now-7.days)
end
