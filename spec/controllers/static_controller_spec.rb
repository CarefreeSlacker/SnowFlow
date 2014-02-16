require 'spec_helper'

describe StaticController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'contacts'" do
    it "returns http success" do
      get 'contacts'
      response.should be_success
    end
  end

end
