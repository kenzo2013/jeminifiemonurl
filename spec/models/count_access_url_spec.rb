require 'rails_helper'

describe "count_access_url" do
    it "count access url" do
      c= FactoryGirl.create(:count_access_url)
      res=CountAccessUrl.find_or_create_by(access_url_id: c.id, date: "11-09-15")
      res.count_click ||= 0
      res.count_click  += 1
      res.save
    end
end

describe "get_data_grafic" do
    it "find data" do
      r=FactoryGirl.create(:count_access_url)
      res=CountAccessUrl.where(["r.date > ? and r.access_url_id = ?", "21-09-15", 1])
      expect(res).to eq(res)
    end
end
