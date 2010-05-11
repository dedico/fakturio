class Company < ActiveRecord::Base
  belongs_to :user
  has_many :clients
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address
# attr_accessible :name, :vat
end
# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  vat        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

