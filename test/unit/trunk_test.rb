require 'test_helper'

class TrunkTest < ActiveSupport::TestCase

  def test_should_create_a_trunk
    trunk = Trunk.new(valid_trunk_attributes(:traceable => "12345678"))
    assert trunk.save
  end

  def test_should_not_save_without_required_attributes
    trunk = Trunk.new(:traceable => "12345678", :kind_id => 1)
    assert !trunk.save
  end

  def test_should_have_3_fixtures
    assert_equal 3, Trunk.count
  end

  def test_should_destroy
    assert_equal 3, Trunk.count
    Trunk.find(:first).destroy
    assert_equal 2, Trunk.count
  end

  def test_should_regard_required_attributes
    trunk = Trunk.new(
              valid_trunk_attributes(:location => nil))
    assert !trunk.save
    trunk = Trunk.new(
              valid_trunk_attributes(:kind_id => nil))
    assert !trunk.save
    trunk = Trunk.new(
              valid_trunk_attributes(:traceable => nil))
    assert !trunk.save
  end

  def test_should_require_8_characters_in_traceable
    trunk = Trunk.new(
              valid_trunk_attributes(:traceable => "1234567"))
    assert !trunk.save
    trunk = Trunk.new(
               valid_trunk_attributes(:traceable => "123456789"))
    assert !trunk.save
  end
  
    def test_traceable_should_be_unique
    trunk1 = Trunk.new(valid_trunk_attributes)
    assert trunk1.save
    trunk2 = Trunk.new(valid_trunk_attributes)
    assert !trunk2.save
  end

  def test_should_respond_to_kind
    trunk = trunks(:one)
    assert_respond_to trunk, :kind
  end

end
