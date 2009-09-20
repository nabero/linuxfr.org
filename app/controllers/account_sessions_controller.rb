class AccountSessionsController < ApplicationController
  before_filter :anonymous_required, :only => [:new, :create]
  before_filter :user_required,    :except => [:new, :create]

  def new
    @account_session = AccountSession.new
  end

  def create
    @account_session = AccountSession.new(params[:account_session])
    if @account_session.save
      flash[:success] = "Vous êtes connecté"
      redirect_to '/'
    else
      render :action => :new
    end
  end

  def destroy
    current_account_session.destroy
    flash[:success] = "Vous êtes déconnecté"
    redirect_to '/'
  end

end
