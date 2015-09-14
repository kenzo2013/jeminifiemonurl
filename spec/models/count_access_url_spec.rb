require 'rails_helper'

describe "count_access_url" do
    it "count access url" do
       res= FactoryGirl.create(:count_access_url)
       expect(res).to eq(res)
    end
end

describe "get_data_grafic" do
    it "find data" do
      r=FactoryGirl.create(:count_access_url)
      res=CountAccessUrl.where(["r.date > ? and r.access_url_id = ?", "21-09-15", 1])
      expect(res).to eq(res)
    end
end
