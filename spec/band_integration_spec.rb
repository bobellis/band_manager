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

describe('adding a new Band', {:type => :feature}) do
  it('adds a new band') do
    visit('/')
    fill_in('new_band', :with => 'Test Band')
    click_button('Save Band')
    expect(page).to have_content('Test Band')
  end
end
