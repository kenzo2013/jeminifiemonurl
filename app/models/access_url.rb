class AccessUrl < ActiveRecord::Base
  belongs_to :url
  has_one :count_access_url
end
