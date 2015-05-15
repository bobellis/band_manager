require('spec_helper')

describe(Band) do
    it("converts the nae to lowercase and then capitalizes the first letter") do
      test_band = Band.create({band_name => 'the Epicodeans'})
      expect(test_band.band_name()).to(eq("The epicodeans"))
    end
end
