# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
    def random_password (len)
        chars = ("a".."z").to_a + ("A".."Z").to_a + ("1".."9").to_a
        newpass = ""
        1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
        return newpass
    end
end