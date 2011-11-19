require File.dirname(__FILE__) + '/../test_helper'

class RemoteAliasTest < Test::Unit::TestCase
  fixtures :remote_aliases

  # Replace this with your real tests.
  def test_truth
    assert_kind_of RemoteAlias, remote_aliases(:first)
  end
end
