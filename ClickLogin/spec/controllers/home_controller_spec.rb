require 'spec_helper'

describe HomeController do 
  describe "Get #index" do
    it "responds successfully with a 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end
  describe "Get #ezee" do
  	it "responds successfully" do
  		get :ezee_login
  		expect(responds).to be_success
  	end
  end
end
