require('spec_helper')

describe(Band) do
    it("converts the name to lowercase and then capitalizes the first letter") do
      test_band = Band.create({:band_name => 'the Epicodeans'})
      expect(test_band.band_name()).to(eq("The epicodeans"))
    end

    it {should have_and_belong_to_many(:venues)}

    it {should validate_presence_of(:band_name)}
end
