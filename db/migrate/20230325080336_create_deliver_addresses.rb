class CreateDeliverAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :deliver_addresses do |t|
      t.string :postcode,            null: false
      t.integer :area_id,            null: false
      t.string :municipality,        null: false
      t.string :address,             null: false
      t.string :building_name
      t.string :telephone_number,    null: false
      t.references :purchase_record, null:false,foreign_key:true

      t.timestamps
    end
  end
end


