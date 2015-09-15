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
      it "will render new template" do
        expect(response).to render_template("new")
      end
      it "will set flash[:error]" do
        expect(flash[:error]).to be_present 
      end
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
        expect(response).to redirect_to(urls_admin_path(:id))
      end
      it "will set flash[:notice]" do
        expect(flash[:notice]).to be_present 
      end
    end
  end
  

  describe "GET admin" do
    it "returns http success" do
      get :admin
      expect(response).to be_success
    end
    it "find url" do 
      u=FactoryGirl.create(:url)
      res=Url.where('id=?',u.id)
      expect(res).to eq(res)
    end
    
    it "get data for graphic" do
      a=FactoryGirl.create(:count_access_url)
      res=CountAccessUrl.get_data_grafic(a.access_url_id)
      expect(res).to eq(res)
    end
    
  end
  
  
  describe "click" do
    it "it should create record on database and redirect to another web site" do
      @url = FactoryGirl.create(:url)
      FactoryGirl.create(:access_url, :url => @url)
      @access_url = FactoryGirl.create(:access_url)
      FactoryGirl.create(:count_access_url, :access_url => @access_url)
      expect(response).to redirect_to("http://www.incarnationpd.org/")
    end
  end
end
