require File.dirname(__FILE__) + '/../test_helper'

class TransportTest < Test::Unit::TestCase
  fixtures :transports

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Transport, transports(:first)
  end
end
