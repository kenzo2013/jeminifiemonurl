require 'rails_helper'

RSpec.describe UrlsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET admin" do
    it "returns http success" do
      get :admin
      expect(response).to be_success
    end
  end

end
