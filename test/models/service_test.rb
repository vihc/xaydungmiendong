# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  parent_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#  sub_service :text
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
