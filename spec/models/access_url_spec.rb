require 'rails_helper'

describe AccessUrl do
  it "should belongs_to url" do
    should belong_to :url
  end
end
