class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.string :street
      t.string :house_number
      t.string :city
      t.string :postcode
      t.string :countr

      t.timestamps
    end

    add_index :addresses, :addressable_id
    add_index :addresses, :addressable_type
  end

  def self.down
    drop_table :addresses
  end
end
