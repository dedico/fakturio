class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true  
end

# == Schema Information
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  addressable_id   :integer
#  addressable_type :string(255)
#  street           :string(255)
#  house_number     :string(255)
#  city             :string(255)
#  postcode         :string(255)
#  countr           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

