class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    render "new"
  end

  def create

    contact = Contact.new(
    :name => params[:contact][:name],
    :adress => params[:contact][:adress],
    :phone => params[:contact][:phone],
    :email => params[:contact][:email])

    contact.save

    redirect_to("/contacts")
  end


end
