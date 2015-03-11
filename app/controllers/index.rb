get '/' do
  erb :index
end

get '/'

post '/bacons' do
  @bacon = Bacon.create()
  {bacon: @bacon}.to_json
end