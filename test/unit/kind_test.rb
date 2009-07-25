require 'test_helper'

class KindTest < ActiveSupport::TestCase

  def test_create_kind
    kind = Kind.new(
              valid_kind_attributes(:scientific => "Tilia mandshurica"))
    assert kind.save, "kind could not be saved"
  end

  def test_should_have_4_fixtures
    assert_equal 4, Kind.count
  end

  def test_should_require_portugues
    kind = Kind.new(
              valid_kind_attributes(:portugues => nil))
    assert !kind.save
  end

  def test_scientific_should_be_unique
    kind1 = Species.new(
              valid_kind_attributes( :scientific => "Tilia ledebourii",
                                        :portugues => "Cavalho;-)"))
    assert kind1.save
    kind2 = Species.new(valid_kind_attributes(
                                        :scientific => "Tilia ledebourii"))
    assert !kind2.save,
    "Scientific unique, shouldn't be possible to save second object"
  end

  def test_should_respond_to_trunks
    kind = kind(:fraxinus)
    assert_respond_to kind, :trunks
    assert_equal 2, kind.trunks.count
  end

end
