require 'rails_helper'

RSpec.describe UrlsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end
  
   describe "create" do
    context "when invalid" do
    # it "will render new template" do
       # expect(response).to render_template("new")
      #end
      #it "will set flash[:error]" do
      #  expect(flash[:error]).to be_present 
      #end
    end
     context "when valid" do
     it "create short url" do
        bitly = Bitly.client
        u = bitly.shorten("http://www.incarnationpd.org/")
        expect(u).to eq(u)
      end
      it "save short and long url" do
        FactoryGirl.create(:url)
      end
      it "redirect to page admin with  id" do
       redirect_to urls_admin_path(:id)
      end
    # it "will set flash[:notice]" do
      # expect(flash[:notice]).to be_present 
     #end
    end
  end
  

  describe "GET admin" do
    it "returns http success" do
      get :admin
      expect(response).to be_success
    end
  end
  
  
  describe "click" do
    it "it should create record on database and redirect to another web site" do
      @url = FactoryGirl.create(:url)
      FactoryGirl.create(:access_url, :url => @url)
      redirect_to "http://www.incarnationpd.org/"
    end
  end
end
