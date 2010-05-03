class Client < ActiveRecord::Base
  belongs_to :company
  has_one :address, :as => :addressable
end

# == Schema Information
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  address_id :integer
#  created_at :datetime
#  updated_at :datetime
#

