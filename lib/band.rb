class Band < ActiveRecord::Base
  validates(:venue_name, :presence => true)
  validates(:venue_name, :uniqueness => true)
  before_save(:capitalize_first_letter)


private
    define_method(:capitalize_first_letter) do
      self.band_name=(band_name().downcase().capitalize)
    end
end
