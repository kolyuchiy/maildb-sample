require File.dirname(__FILE__) + '/../test_helper'

class RcptAccessTest < Test::Unit::TestCase
  fixtures :rcpt_accesses

  # Replace this with your real tests.
  def test_truth
    assert_kind_of RcptAccess, rcpt_accesses(:first)
  end
end
