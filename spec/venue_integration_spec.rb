ENV["RACK_ENV"] = "test"

require('capybara/rspec')
require('./app')
# require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('see the landing page', {:type => :feature}) do
  it('displays the landing page') do
    visit('/')
    expect(page).to have_content('Band MANager')
  end
end

describe('adding a new venue', {:type => :feature}) do
  it('adds a new venue') do
    visit('/')
    click_link('Add Venues')
    fill_in('new_venue', :with => 'Test Venue')
    click_button('Save Venue')
    expect(page).to have_content('Test venue')
  end
end
