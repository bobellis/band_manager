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

post('/') do
  Band.create({:band_name => params.fetch('new_band')})
  @bands = Band.all()
  erb(:index)
end

get('/band/:id') do
  @band = Band.find(params.fetch('id').to_i())
  @venues = @band.venues()
  @all_venues = Venue.all() - @venues
  erb(:band)
end

patch('/band/:id') do
  @band = Band.find(params.fetch('id'))
  @venue_ids = params.fetch('venue_ids')
  @venue_ids.each do |venue_id|
    @new_venue = Venue.find(venue_id)
    @band.venues.push(@new_venue)
  end
  @venues = @band.venues()
  @all_venues = Venue.all() - @venues
  erb(:band)
end
