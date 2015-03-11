require_relative '../spec_helper'

describe "Authentication controller"  do
  let(:user) {User.create(name: "Crab Daddy",  password: "123", mantra: "yolo", image_url: "www.google.com")}


describe "GET '/'" do
    it "loads homepage" do
      get '/'
      expect(last_response).to be_ok
    end

    it "displays homepage content" do
      get '/welcome'
      expect(last_response.body).to include("panic zone")
    end
end

describe 'POST /login' do
    it 'should log in a registered user' do
      post '/login', params={user:{mantra: "yolo", password: "123"}}
      expect(last_response).to be_redirect
      follow_redirect!
      last_request.path.should == "/welcome"
   end
end

  describe 'POST /signup' do
    it 'should register a user' do
      get '/signup', params={user:{name: "Crab Daddy", mantra: "yolo", password: "123"}}
      expect(last_response).to be_redirect
      follow_redirect!
      last_request.path.should == "/welcome"
    end
  end

end