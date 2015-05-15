require('spec_helper')

describe(Venue) do
    it("converts the name to lowercase and then capitalizes the first letter") do
      test_venue = Venue.create({venue_name => 'the Epicenter'})
      expect(test_venue.venue_name()).to(eq("The epicenter"))
    end
end
