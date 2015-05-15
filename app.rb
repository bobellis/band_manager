require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @bands = Band.all
  erb(:index)
end

get('/venues/') do
  @venues = Venue.all()
  erb(:venues)
end

post('/venue/save/') do
  Venue.create({:venue_name => params.fetch('new_venue')})
  @venues = Venue.all()
  erb(:venues)
end
