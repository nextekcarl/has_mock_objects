require 'test_helper'

class HasMockObjectsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, HasMockObjects
  end
end
