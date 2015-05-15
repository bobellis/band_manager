ENV["RACK_ENV"] = "test"

require('capybara/rspec')
require('./app')

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
    expect(page).to have_content('Test band')
  end
end

describe('adding a venue to a band', {:type => :feature}) do
  it('adds a venue to a band') do
    visit('/')
    click_link('Add Venues')
    fill_in('new_venue', :with => 'New Test Venue')
    click_button('Save Venue')
    click_link("Go home!")
    fill_in('new_band', :with => 'New Test Band')
    click_button('Save Band')
    click_link("New test band")
    page.check("New test venue")
    click_button("Add venues")
    expect(page).to have_content('New test venue')

  end

end
