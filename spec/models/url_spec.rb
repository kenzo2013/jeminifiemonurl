require 'rails_helper'

describe Url do
  it "should have many access url" do
    should have_many :access_urls
  end
end
