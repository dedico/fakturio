require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

