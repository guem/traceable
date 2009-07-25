ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  #
  # The only drawback to using transactional fixtures is when you actually 
  # need to test transactions.  Since your test is bracketed by a transaction,
  # any transactions started in your code will be automatically rolled back.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def valid_trunk_attributes(add_attributes={})
    {
      :traceable => "11223344",
      :kind_id => kind(:quercus).id,
      :location => "Magdeburg",
      :description => "This is the description of a test trunk"
    }.merge(add_attributes)
  end

  def valid_kind_attributes(add_attributes={})
    {
      :scientific => "Quercus robur",
      :portugues => "Carvalho",
      :description => "This is the description of a test kind"
    }.merge(add_attributes)
  end

  def valid_process_trunk_attributes(add_attributes={})
    {
      :trunk_id => trunks(:one).id,
      :date => Time.parse("2008-07-13 02:09"),
      :description => "This is the description of a process trunk object"
    }.merge(add_attributes)
  end

end
