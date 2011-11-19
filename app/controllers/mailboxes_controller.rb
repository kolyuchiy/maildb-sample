require 'facets/more/crypt'

class MailboxesController < ApplicationController
  web_service_api MailboxesApi

  def index
    list
    render :action => 'list'
  end

  def list
    @mailbox_pages, @mailboxes = paginate :mailboxes, :per_page => 10
  end

  def show
    @mailbox = Mailbox.find(params[:id])
  end

  def new
    @mailbox = Mailbox.new
    @mailbox.login = "p3cc"
    @mailbox.password = random_password(8)
    @mailbox.alias = ".elcom.ru"
  end

  def create
    @mailbox = Mailbox.new(params[:mailbox])
    
    @transport = Transport.new()
    @transport.domain = @mailbox.alias
    @transport.transport = "virtual:"
    
    @remote_alias = RemoteAlias.new()
    @remote_alias.alias = "@" + @mailbox.alias
    @remote_alias.rcpt = "root@" + @mailbox.alias
    
    @rcpt_access = RcptAccess.new()
    @rcpt_access.alias = @mailbox.alias
    @rcpt_access.action = "OK"

    @mailbox.gid = 6
    @mailbox.alias = "root@" + @mailbox.alias
    @mailbox.maildir = "/usr2/vmail2/" + @mailbox.login
    @mailbox.password = Crypt.crypt(@mailbox.password, :md5)
    
    if  @mailbox.save and @transport.save and @remote_alias.save and @rcpt_access.save
      flash[:notice] = 'Mailbox was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @mailbox = Mailbox.find(params[:id])
  end

  def update
    @mailbox = Mailbox.find(params[:id])
    if @mailbox.update_attributes(params[:mailbox])
      flash[:notice] = 'Mailbox was successfully updated.'
      redirect_to :action => 'show', :id => @mailbox
    else
      render :action => 'edit'
    end
  end

  def destroy
    Mailbox.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
