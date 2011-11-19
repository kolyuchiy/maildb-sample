class Mailbox < ActiveRecord::Base
    validates_presence_of :login, :password, :alias
    validates_uniqueness_of :login, :alias
    validates_format_of :alias, :with => /^root@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

    @column_names_to_show = ["id", "login", "alias", "maildir", "quota", "info"]
    
    def self.columns_to_show
        unless @columns_to_show
            @columns_to_show = columns
            @columns_to_show.delete_if {|column| not @column_names_to_show.include? column.name }
        end
        @columns_to_show
    end    
end
