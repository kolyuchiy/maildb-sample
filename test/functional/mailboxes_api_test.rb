require File.dirname(__FILE__) + '/../test_helper'
require 'mailboxes_controller'

class MailboxesController; def rescue_action(e) raise e end; end

class MailboxesControllerApiTest < Test::Unit::TestCase
  def setup
    @controller = MailboxesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_delete
    result = invoke :delete
    assert_equal nil, result
  end
end
