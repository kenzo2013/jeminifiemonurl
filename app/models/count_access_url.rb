class CountAccessUrl < ActiveRecord::Base
  require 'active_support/all'
  belongs_to :access_url
  
  def self.count_access_url(access_url_id, date)
    c = self.find_or_create_by(access_url_id: access_url_id, date: date)
    c.count_click ||= 0
    c.count_click  += 1
    c.save
  end
  
  def self.get_data_grafic(access_url_id)
    self.where(["date > ? and access_url_id = ?", (Time.now - 7.days).strftime("%Y-%d-%m"), access_url_id])
  end
  
end
