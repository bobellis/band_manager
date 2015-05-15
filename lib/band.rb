class Band < ActiveRecord::Base
  validates(:band_name, :presence => true)
  validates(:band_name, :uniqueness => true)
  before_save(:capitalize_first_letter)
  has_and_belongs_to_many :venues

private
    define_method(:capitalize_first_letter) do
      self.band_name=(band_name().downcase().capitalize)
    end
end
