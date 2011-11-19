require File.dirname(__FILE__) + '/../test_helper'

class MailboxTest < Test::Unit::TestCase
  fixtures :mailboxes

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Mailbox, mailboxes(:first)
  end
end
