class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |b|
      b.column(:band_name, :string)

      b.timestamps()
    end
    create_table(:venues) do |v|
      v.column(:venue_name, :string)

      v.timestamps()
    end
    create_table(:bands_venues) do |bv|
      bv.column(:band_id, :int)
      bv.column(:venue_id, :int)

      bv.timestamps()
    end
  end
end
